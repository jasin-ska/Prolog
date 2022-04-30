arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osi퉓alny2(X, X).
osi퉓alny2(X, Y) :- arc(X, Y).

osi퉓alny2(X, Y) :- osi퉓alny2(X, Y, [X]).

osi퉓alny2(X, Z, Odwiedzone) :- arc(X, Y),
    \+ member(Y, Odwiedzone),
    (   arc(Y, Z);
        osi퉓alny2(Y, Z, [Y|Odwiedzone])),
    \+ member(Z, Lvisited).

osi퉓alny(X, Y) :- distinct(osi퉓alny2(X, Y)).
