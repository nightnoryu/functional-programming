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

four_hobbies(P) :- likes(P, H1), likes(P, H2), likes(P, H3), likes(P, H4),
  different(H1, H2), different(H1, H3), different(H1, H4),
  different(H2, H3), different(H2, H4),
  different(H3, H4).

shared_hobby(P1, P2, H) :- likes(P1, H), likes(P2, H), different(P1, P2).

different(X, Y) :- X \= Y.
