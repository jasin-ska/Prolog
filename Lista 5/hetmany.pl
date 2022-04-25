dobra(X) :-
\+ z³a(X).

z³a(X) :-
    append(_, [Wi | L1], X),
    append(L2, [Wj | _], L1),
    length(L2, K),
    abs(Wi - Wj) =:= K + 1.

hetmany(N, P) :-
    numlist(1, N, L), % stworzenie listy liczb 1 .. N
    permutation(L, P),
    dobra(P).
