�rodkowy([X], X).

�rodkowy(L3, X) :- append(L1, L2, L3),
    L1 = [_|L],
    L2 = [_|[]],
    �rodkowy(L, X).



