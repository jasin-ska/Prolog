arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osi�galny2(X, X).
osi�galny2(X, Y) :- arc(X, Y).

osi�galny2(X, Y) :- osi�galny2(X, Y, [X]).

osi�galny2(X, Z, Odwiedzone) :- arc(X, Y),
    \+ member(Y, Odwiedzone),
    (   arc(Y, Z);
        osi�galny2(Y, Z, [Y|Odwiedzone])),
    \+ member(Z, Lvisited).

osi�galny(X, Y) :- distinct(osi�galny2(X, Y)).
