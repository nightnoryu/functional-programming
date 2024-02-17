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
