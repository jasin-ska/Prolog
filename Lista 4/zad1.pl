wyra¿enie2([X], X, X).

wyra¿enie2(L, Y, W) :-
    append(L1, L2, L),
    \+(L1 = []), % unifikacja z [] zamiast length - szybsze
    \+(L2 = []),
    wyra¿enie2(L1, Y1, W1),
    wyra¿enie2(L2, Y2, W2),
       ((Y is Y1 * Y2, W = W1 * W2);
       (Y is Y1 - Y2, W = W1 - W2);
       (Y is Y1 + Y2, W = W1 + W2);
       (Y2 =\= 0, Y is Y1 / Y2, W = W1 / W2)).


wyra¿enie(L, X, W) :- distinct(wyra¿enie2(L, X, W)).




% jesli chcemy tylko jedno
wyra¿enie3(L, X, W) :- once(wyra¿enie2(L, X, W)).
