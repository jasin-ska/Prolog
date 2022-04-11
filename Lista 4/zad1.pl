wyra¿enie2([X], X, X).

%wyra¿enie2([X | T], Y, W) :-
%    wyra¿enie2(T, Y1, W1),
%    ((   W = X * W1, Y is X * Y1);
%    (   W = X - W1, Y is X - Y1);
%    (   W = X + W1, Y is X + Y1);
%    (   Y1 =\= 0, W = X / W1, Y is X / Y1)).

wyra¿enie2(L, Y, W) :-
    append(L1, L2, L),
    length(L1, Le1), Le1 > 0,
    length(L2, Le2), Le2 > 0,
    wyra¿enie2(L1, Y1, W1),
    wyra¿enie2(L2, Y2, W2),
    ((   W = W1 * W2, Y is Y1 * Y2);
    (   W = W1 - W2, Y is Y1 - Y2);
    (   W = W1 + W2, Y is Y1 + Y2);
    (   Y2 =\= 0, W = W1 / W2, Y is Y1 / Y2)).


wyra¿enie(L, X, W) :- distinct(wyra¿enie2(L, X, W)).
