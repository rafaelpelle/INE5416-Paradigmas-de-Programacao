/*
   Programacao Logica - Prof. Alexandre G. Silva - 30set2015
   
   RECOMENDACOES:
   
   - O nome deste arquivo deve ser 'programa.pl'
   
   - O nome do banco de dados deve ser 'desenhos.pl'
   
   - Dicas de uso podem ser obtidas na execucação: 
     ?- menu.
     
   - Exemplo de uso:
     ?- load.
     ?- searchAll(id1).
     
   - Colocar o nome e matricula de cada integrante do grupo
     nestes comentarios iniciais do programa
*/

% Apaga os predicados 'xy' da memoria e carrega os desenhos a partir de um arquivo de banco de dados
load :-
    retractall(xy(_,_,_)),
    open('desenhos.pl', read, Stream),
    repeat,
        read(Stream, Data),
        (Data == end_of_file -> true ; assert(Data), fail),
        !,
        close(Stream).

% Ponto de deslocamento, se <Id> existente
new(Id,X,Y) :-
    xy(Id,_,_),
    assertz(xy(Id,X,Y)),
    !.

% Ponto inicial, caso contrario
new(Id,X,Y) :-
    asserta(xy(Id,X,Y)),
    !.

% Exibe opcoes de busca
search :-
    write('searchAll(Id).     -> Ponto inicial e todos os deslocamentos de <Id>'), nl,
    write('searchFirst(Id,N). -> Ponto inicial e os <N-1> primeiros deslocamentos de <Id>'), nl,
    write('searchLast(Id,N).  -> Lista os <N> ultimos deslocamentos de <Id>').

searchAll(Id) :-
    listing(xy(Id,_,_)).

searchLast(Id, N) :-
	findall((Id, X, Y), xy(Id, X, Y), L),
	pegaNultimos(L, [], N, LResp),
	write(LResp).


pegaNaux(L2, L3, N, N, L3) :- !.
pegaNaux(L2, L3, N, Y, LResp) :- Y1 is Y-1, nth0(Y1, L2, X), pegaNaux(L2, [X|L3], N, Y1, LResp).
  
pegaNultimos(L, L2, N, LResp) :- length(L, X), M is X-N, pegaNaux(L, L2, M, X, LResp).

searchFirst(Id, N) :-
	findall((Id, X, Y), xy(Id, X, Y), L),
	pegaNprimeiros(L, [], N, Lresp),
	reverse(Lresp, Linv),
	write(Linv).

pegaNaux2(L2, L3, N, N, L3) :- !.
pegaNaux2(L2, L3, N, Y, LResp) :- nth0(Y, L2, X), Y1 is Y+1, pegaNaux2(L2, [X|L3], N, Y1, LResp).
  
pegaNprimeiros(L, L2, N, LResp) :- pegaNaux2(L, L2, N, 0, LResp).


% Exibe opcoes de alteracao
change :-
    write('change(Id,X,Y,Xnew,Ynew).  -> Altera um ponto de <Id>'), nl,
    write('changeFirst(Id,Xnew,Ynew). -> Altera o ponto inicial de <Id>'), nl,
    write('changeLast(Id,Xnew,Ynew).  -> Altera o deslocamento final de <Id>').

change(Id,X,Y,Xnew,Ynew) :-
	findall((Id, A, B), xy(Id, A, B), L), %Lista com os pontos do BD
	length(L, N),
	nth0(0, L, (Id, A1, B1)),
	swapListas(L, Id, X, Y, Xnew, Ynew, 0, N, A1, B1).


swapListas(L, Id, X, Y, Xnew, Ynew, N, N, A, B) :- !.
swapListas(L, Id, X, Y, Xnew, Ynew, Iterador, N, X, Y) :- 
								retract(xy(Id, X, Y)),
								assertz(xy(Id, Xnew, Ynew)),
								I1 is Iterador + 1,
								nth0(I1, L, (Id, A, B)),
								swapListas(L, Id, X, Y, Xnew, Ynew, I1, N, A, B).
swapListas(L, Id, X, Y, Xnew, Ynew, Iterador, N, A, B) :-
								retract(xy(Id, A, B)),
								assertz(xy(Id, A, B)),
								I1 is Iterador + 1,
								nth0(I1, L, (Id, X1, Y1)),
								swapListas(L, Id, X, Y, Xnew, Ynew, I1, N, X1, Y1).



first(X, [X|_]) :- !.

changeFirst(Id, Xnew, Ynew) :-
	findall((Id, A, B), xy(Id, A, B), L), %Lista com os pontos do BD

	first((Id2, Y, Z), L),

	retract(xy(Id2,Y, Z)),
	asserta(xy(Id2, Xnew, Ynew)).

last(X,[X]) :- !.
last(X,[_|Z]) :- last(X,Z).

changeLast(Id, Xnew, Ynew) :-
	findall((Id, A, B), xy(Id, A, B), L),
	last((Id2, Y, Z), L),
	retract(xy(Id2, Y, Z)),
	assert(xy(Id2, Xnew, Ynew)).

% Grava os desenhos da memoria em arquivo
commit :-
    open('desenhos.pl', write, Stream),
    telling(Screen),
    tell(Stream),
    listing(xy),
    tell(Screen),
    close(Stream).

remove(Id, X, Y) :- retract(xy(Id, X, Y)).

undo :- findall((Id, X,Y), xy(Id, X, Y), L),
	length(L, N),
	M is N-1,
	nth0(M, L, (Id1, A, B)),
	retract(xy(Id1, A, B)).

replicaAux(Id, 0, Dx, Dy) :- !.
replicaAux(Id, N, Dx, Dy) :-
			figura(Id+N, Dx, Dy),
			M is N-1,
			DxAux is Dx*N,
			DyAux is Dy*N,
			replicaAux(Id+N, M, DxAux, DyAux).

% Replica um desenho N vezes em deslocamentos
% Dx na horizontal e Dy na vertical. 
replica(Id, N, Dx, Dy) :- 
			figura(Id, 0, 0),
			M is N-1,
			replicaAux(Id, M, Dx, Dy).

% Deslocamentos necessarios em para produzir um triangulo equilátero.
triangulo(Id, X, Y, Lado) :-
			new(Id, X, Y),
			new(Id, Lado, 0.0),
			Xaux is -(Lado/2),
			Yaux is (Lado**2 - (Lado/2)**2)**(1/2),
			new(Id, Xaux, Yaux),
			commit.

trianguloInverso(Id, X, Y, Lado) :-
			new(Id, X, Y),
			new(Id, Lado, 0.0),
			Xaux is -(Lado/2),
			Yaux is -((Lado**2 - (Lado/2)**2)**(1/2)),
			new(Id, Xaux, Yaux),
			commit.

% Deslocamentos necessários para produzir um desenho qualquer, 
% de sua preferência, com ao menos 5 coordenadas e ponto inicial em (X,Y).
figura(Id, X, Y) :-
		Yaux is Y+220,		
		triangulo(Id, X, Y, 400),
		trianguloInverso(Id+999, X, Yaux, 400).


% Exibe menu principal
menu :-
    write('load.        -> Carrega todos os desenhos do banco de dados para a memoria'), nl,
    write('new(Id,X,Y). -> Insere um deslocamento no desenho com identificador <Id>'), nl,
    write('                (se primeira insercao, trata-se de um ponto inicial)'), nl,
    write('search.      -> Consulta pontos dos desenhos'), nl,
    write('change.      -> Modifica um deslocamento existente do desenho'), nl,
    write('remove.      -> Remove um determinado deslocamento existente do desenho'), nl,
    write('undo.        -> Remove o deslocamento inserido mais recentemente'), nl,
    write('commit.      -> Grava alteracoes de todos dos desenhos no banco de dados').
