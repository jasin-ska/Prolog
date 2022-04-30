jednokrotnie(X, L) :- select(X, L, L2),
    \+member(X, L2).

dwukrotniex2(X, L) :- select(X, L, L2), %wypisuje podwojnie
    jednokrotnie(X, L2).

dwukrotnie(X, L) :- distinct(dwukrotniex2(X, L)).
