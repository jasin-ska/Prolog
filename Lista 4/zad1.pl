%wyra¿enie2([], 0, 1).

wyra¿enie2([X], X, X).

%wyra¿enie2([X, Y], Z, W) :-
 %    ((Z is X * Y, W = X * Y);
  %   (Z is X - Y, W = X - Y);
   %  (Z is X + Y, W = X + Y);
    % (Y =\= 0, Z is X / Y, W = X / Y)).

wyra¿enie2(L, Y, W) :-
    append(L1, L2, L),
    length(L1, Le1), Le1 > 0,
    length(L2, Le2), Le2 > 0,
    wyra¿enie2(L1, Y1, W1),
    wyra¿enie2(L2, Y2, W2),
       ((Y is Y1 * Y2, W = W1 * W2);
       (Y is Y1 - Y2, W = W1 - W2);
       (Y is Y1 + Y2, W = W1 + W2);
       (Y2 =\= 0, Y is Y1 / Y2, W = W1 / W2)).


wyra¿enie(L, X, W) :- distinct(wyra¿enie2(L, X, W)).
