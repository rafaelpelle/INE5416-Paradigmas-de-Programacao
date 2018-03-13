:- consult('cco.pl').

% Questão 1 (resolvida)
discfase(D, F) :- disciplina(F, D, _).

% Escrever demais questões...
prereqfase(Dpr, Fpr) :- prerequisito(Dpr, _) , disciplina(Fpr, Dpr, _).

nomeprereqnome(Npr, N) :- prerequisito(X, Y), disciplina(_, X, Npr), disciplina(_, Y, N).

nomeprereqfase(Npr, Dpr, Fpr) :- disciplina(Fpr, Dpr, Npr), prerequisito(Dpr, _).

prereqdiscfase(Dpr, D, F) :- prerequisito(Dpr, D), disciplina(F, D, _).

prereqdiscfaseprereq(Dpr, D, Fpr) :- prerequisito(Dpr, D), disciplina(Fpr, Dpr, _).

nomeprereqdiscfase(Npr, Dpr, D, F) :- prerequisito(Dpr, D), disciplina(F, D, _), disciplina(_, Dpr, Npr).



