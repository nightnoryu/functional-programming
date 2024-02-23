% Задание 1

trim(L1, L2) :- append([_|L2], [_], L1).

% Задание 2

first_last(L1, L2) :- append([H|T], [Last], L1), append([Last|T], [H], L2).

% Задание 3

total([], 1).
total([H|T], N) :- total(T, NP), N is H * NP.

% Задание 4

place(X, L1, L2) :- append([X], L1, L2).
place(X, [H|T1], [H|T2]) :- place(X, T1, T2).

% Задание 5

double([], []).
double([H|T1], [H,H|T2]) :- double(T1, T2).

% Задание 6

split([], [], []).
split(L1, [H|T2], L3) :- append(T1, [H], L1), even(H), split(T1, T2, L3).
split(L1, L2, [H|T3]) :- append(T1, [H], L1), not(even(H)), split(T1, L2, T3).

even(N) :- mod(N, 2) =:= 0.

% Задание 7

repeat3(L1, L2) :- append([H|T], [Last], L1), append([Last, Last, Last | T], [H, H, H], L2).

% Задание 8

combi([], L2, L2).
combi(L1, [], L1).
combi([H1|T1], [H2|T2], [H1, H2 | T3]) :- combi(T1, T2, T3).
