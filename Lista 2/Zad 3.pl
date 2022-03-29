arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osi¹galny(X, Y) :- arc(X, Y).
osi¹galny(X, Z) :- arc(X, Y), osi¹galny(Y, Z).
