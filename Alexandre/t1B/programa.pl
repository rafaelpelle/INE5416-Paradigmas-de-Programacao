:- consult('cco.pl').

% Questão 1
precomum(Dpr, D1, D2) :- prerequisito(Dpr, D1), prerequisito(Dpr, D2), (D1 \= D2).

% Questão 2
precomumsaopre(D1, D2, F) :- precomum(_, D1, D2), prerequisito(D1, _), prerequisito(D2, _), disciplina(F, D1, _), disciplina(F, D2, _).

% Questão 3
prepre(Dpr, D) :- prerequisito(Dpr, Y), prerequisito(Y, D).

% Questão 4
predistante(Dpr, D) :- prerequisito(Dpr, D), disciplina(X, Dpr, _), disciplina(Y, D, _), (X < Y-1).

% Questão 5
prefasepar(Dpr, D) :- prerequisito(Dpr, D), disciplina(F, Dpr, _), 0 is mod(F,2).

% Questão 6 - RESOLVIDA
precadeia(X, []) :- \+prerequisito(X, _).
precadeia(X, [Y|Lc]) :- prerequisito(X, Y), precadeia(Y, Lc).

% Questão 7
precadeiatamanho(D, T) :- precadeia(D, L), length(L, T).
