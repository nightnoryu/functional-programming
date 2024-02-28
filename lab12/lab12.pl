% Задание 1

% Отсечение красное.

% Пример:
% member(1, [1, 2, 3]).

% С отсечением:
% true.

% Без отсечения:
% true;
% false.

% Задание 2

fib(1, 1) :- !.
fib(2, 1) :- !.
fib(N, F) :- N > 2,
  N1 is N - 1, N2 is N - 2,
  fib(N1, F1), fib(N2, F2),
  F is F1 + F2.

% Задание 3

% Задание 4

sort_4_1 :- write('list? '),
  read(L),
  sort_4_1(L, S),
  write('answer: '),
  write(S).

sort_4_1(L1, L2) :- permutation(L1, L2), sorted(L2), !.

sort_4_2 :- write('list? '),
  read(L),
  sort_4_2(L, S),
  write('answer: '),
  write(S).

sort_4_2(L1, L2) :- swap(L1, M), !, sort_4_2(M, L2).
sort_4_2(L, L) :- !.

sort_4_3 :- write('list? '),
  read(L),
  sort_4_3(L, S),
  write('answer: '),
  write(S).

sort_4_3([], []).
sort_4_3([X|T], M) :- sort_4_3(T, N), sort_4_3_x(X, N, M).
sort_4_3_x(X, [A|L], [A|M]) :- order(A, X), !, sort_4_3_x(X, L, M).
sort_4_3_x(X, L, [X|L]).

sort_4_4 :- write('list? '),
  read(L),
  sort_4_4(L, S),
  write('answer: '),
  write(S).

sort_4_4([], []).
sort_4_4([H|T], S) :- split(H, T, Small, Big), sort_4_4(Small, Small1), sort_4_4(Big, Big1), append(Small1, [H|Big1], S).

permutation(L, [H|T]) :- append(V, [H|U], L),
  append(V, U, W),
  permutation(W, T).
permutation([], []).

sorted([_]).
sorted([X,Y|T]) :- order(X, Y), sorted(T).

swap([X, Y|T], [Y, X|T]) :- order(Y, X).

split(H, [A|T], [A|Small], Big) :- order(A, H), !, split(H, T, Small, Big).
split(H, [_|T], Small, [_|Big]) :- split(H, T, Small, Big).
split(_, [], [], []).

order(X, Y) :- X =< Y.

% Задание 5

% common(L1, L2, L3)

% Задание 7
