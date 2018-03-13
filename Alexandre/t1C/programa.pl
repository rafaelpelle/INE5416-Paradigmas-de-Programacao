:- consult('cco.pl').

maximo_lista([X],X) :- !.
maximo_lista([X|Xs], M):- maximo_lista(Xs, M), M >= X.
maximo_lista([X|Xs], X):- maximo_lista(Xs, M), X > M.

posicao_maximo(L,P) :- max_list(L,M), argmax(L,M,0,P).
argmax([],_,_,_) :- fail.
argmax([A|_],M,P,P) :- A=:=M.
argmax([_|B],M,Pacc,P) :- P1 is Pacc + 1, argmax(B,M,P1,P).


% Questao 1 - t1C
nfase(F, N) :- findall(X, disciplina(F, X, _), L), length(L, N).

% Questao 2 - t1C
ncurso(N) :- findall(_, disciplina(_, _, _), L), length(L, N).

% Questao 3 - t1C
ntempre(N) :- setof(X, Y^prerequisito(Y, X), L), length(L, N).

% Questao 4 - t1C
nsaopre(N) :- setof(X, Y^prerequisito(X, Y), L), length(L, N).

% Questao 5 - t1C
npre(D, N) :- findall(_, prerequisito(_, D), L), length(L, N).

% Questao 6 - t1C
maispre(L) :- findall(N, npre(X, N), L).

% Questao 7 - t1C
npos(D, N) :-  findall(X, prerequisito(D, X), L), length(L, N).

% Questao 8 - t1C
maispos(D2) :-  true.

% Questao 9 - t1C
maiorcadeia(N) :- true.
