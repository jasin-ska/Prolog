jednokrotnie(X, L) :- select(X, L, L2),
    \+member(X, L2).


lista(N, X) :- MaxSize is 2*N, distinct(add(N, MaxSize, [], 1, 0, X)).

add(N, MaxSize, List, Max, Size, ListOut) :- Size = MaxSize,
    ListOut = List.
add(N, MaxSize, List, Max, Size, ListOut) :-
    Size < MaxSize,
    between(1, Max, X),
    once(jestOk(X, List)),
    ((  (Max = N; Max >= X),
        Max2 = Max ) ; ( Max2 is X + 1, Max2 =< N)),
    append(List, [X], List2),
    Size2 is Size+1,
    add(N, MaxSize, List2, Max2, Size2, ListOut).

jestOk(X, L) :- \+member(X, L); (jednokrotnie(X, L), parzysteZa(X, L)).

parzysteZa(X, [X]).
parzysteZa(X, L2) :-
    append(L, L1, L2),
    L1 = [_,_],
    parzysteZa(X, L).
parzysteZa(X, L2) :-
    append(L1, L, L2),
    L1 = [_],
    parzysteZa(X, L).






