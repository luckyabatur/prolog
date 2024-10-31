:- consult('two.pl').

subjects(L) :- setof(S, A^B^C^grade(A, B, S, C), L).
groups(L) :- setof(G, A^B^C^grade(G, A, B, C), L).

sum([], 0).
sum([X|L], T) :- sum(L, T1), T is X + T1.

average(S, A) :- findall(X, grade(S, _, _, X), L), length(L, N), sum(L, T), A is T / N.
average_all(S, A) :- groups(L), member(S, L),  average(S, A).

faillist(S, L) :- subjects(T), member(S, T), findall(S, grade(_, _, S, 2), L). 

failg(G, C) :- groups(T), member(G, T), findall(G, grade(G, _, _, 2), L), length(L, C).