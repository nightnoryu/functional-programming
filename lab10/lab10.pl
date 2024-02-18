% Задание 1

seg(1, point(1, 11), point(14, 11)).
seg(2, point(2, 4), point(13, 4)).
seg(3, point(2, 2), point(9, 2)).
seg(4, point(3, 10), point(3, 1)).
seg(5, point(7, 10), point(13, 10)).
seg(6, point(8, 13), point(8, 0)).
seg(7, point(10, 12), point(10, 3)).
seg(8, point(11, 13), point(11, 3)).
seg(9, point(12, 12), point(12, 2)).

horiz(N) :- seg(N, point(_, Y), point(_, Y)).
vertical(N) :- seg(N, point(X, _), point(X, _)).

% Задание 2

seglength(N, L) :- seg(N, point(X1, Y1), point(X2, Y2)),
  L is sqrt((X2 - X1) * (X2 - X1) + (Y2 - Y1) * (Y2 - Y1)).

cross(N, M, point(X, Y), NL, ML) :-
