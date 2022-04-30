œrodkowy([X], X).

œrodkowy(L3, X) :- append(L1, L2, L3),
    L1 = [_|L],
    L2 = [_|[]],
    œrodkowy(L, X).



