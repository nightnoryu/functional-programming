% Задание 1

male(bill).
male(paul).
male(joe).
male(jim).
male(bob).

female(sue).
female(mary).
female(ann).
female(tammy).

parent(bill, joe).
parent(sue, joe).
parent(bill, ann).
parent(sue, ann).
parent(paul, jim).
parent(mary, jim).
parent(joe, tammy).
parent(ann, bob).
parent(jim, bob).

grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).

grandson(X, Y) :- parent(Y, Z), parent(Z, X), male(X).

sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), different(X, Y).

different(X, Y) :- X \= Y.

aunt(X, Y) :- sister(X, Z), parent(Z, Y).

cousin(X, Y) :- parent(A, X), parent(B, Y), sibling(A, B).

sibling(X, Y) :- different(X, Y), parent(Z, X), parent(Z, Y).

% Вопросы
% ?- grandmother(X, bob).
% ?- grandson(X, Y).
% ?- sister(X, jim).
% ?- aunt(ann, tammy).
% ?- cousin(bob, tammy).

% Задание 2

likes(ellen, reading).
likes(john, computers).
likes(john, badminton).
likes(john, photo).
likes(john, reading).
likes(leonard, badminton).
likes(eric, swimming).
likes(eric, reading).
likes(eric, chess).
likes(paul, swimming).

has_four_hobbies(P) :- likes(P, H1), likes(P, H2), likes(P, H3), likes(P, H4),
  different(H1, H2), different(H1, H3), different(H1, H4),
  different(H2, H3), different(H2, H4),
  different(H3, H4).

have_shared_hobby(P1, P2, H) :- likes(P1, H), likes(P2, H), different(P1, P2).

% Вопросы
% ?- has_four_hobbies(john).
% ?- have_shared_hobby(ellen, eric, reading).
