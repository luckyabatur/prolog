/**swi prolog
length, append, select, member - есть встроенные
permute, sublist - отсутствуют **/


length1([], 0).
length1([_|Y], N) :- length1(Y, N1), N is N1 + 1.

member1(X, [X|_]).
member1(X, [_|T]) :- member1(X, T).

append1([], L, L).
append1([X|T], Y, [X|R]) :- append1(T, Y, R).

remove(X, [X|L], L).
remove(X, [Y|L], [Y|R]) :- remove(X, L, R).

permute([], []).
permute(L, [Y|T]) :- remove(Y, L, R), permute(R, T).

sublist(L, R) :- append(_, T, R), append(L, _, T).


insert(X, I, L, R) :- append(T, B, L), length(T, I), append(T, [X], K), append(K, B, R).

insert1(X, 0, L, [X|L]).
insert1(X, I, [_|T], R) :-  I >= 1, I1 is I - 1, insert1(X, I1, T, R).


negative(L, I) :- append(T, [X|_], L), X < 0, length(T, I).

negative1([X|_], 0) :- X < 0.
negative1([_|L], I) :- negative1(L, I1), I is I1 + 1.
