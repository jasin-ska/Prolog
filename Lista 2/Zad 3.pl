arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osi�galny(X, Y) :- arc(X, Y).
osi�galny(X, Z) :- arc(X, Y), osi�galny(Y, Z).
