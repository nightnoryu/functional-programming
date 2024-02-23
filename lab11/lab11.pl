% Задание 1

trim([_|T], L) :- reverse(T, [_|RT]), reverse(RT, L).

% Задание 2

first_last([H1|T], L2) :- reverse(T, [H2|RT]), reverse(RT, RRT), append([H2], RRT, T2), append(T2, [H1], L2).

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
% TODO: reversed

split([], [], []).
split([H|T1], [H|T2], L3) :- 0 is H mod 2, split(T1, T2, L3).
split([H|T1], L2, [H|T3]) :- 1 is H mod 2, split(T1, L2, T3).

% Задание 7

repeat3(L1, L2) :- append([H|T], [Last], L1), append([Last, Last, Last | T], [H, H, H], L2).

% Задание 8

combi([], L2, L2).
combi(L1, [], L1).
combi([H1|T1], [H2|T2], [H1, H2 | T3]) :- combi(T1, T2, T3).
