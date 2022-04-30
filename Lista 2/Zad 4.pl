jednokrotnie(X, L) :- select(X, L, L2),
    \+member(X, L2).

lista(N, X) :- MaxSize is 2*N, distinct(add(N, MaxSize, [], 1, 0, X)).

add(_, MaxSize, List, _, Size, ListOut) :- Size = MaxSize,
    ListOut = List.
add(N, MaxSize, List, Max, Size, ListOut) :-
    Size < MaxSize,
    between(1, Max, X),
    once(jestOk(X, List)),
    once(max(Max, Max2, N, X)),
    append(List, [X], List2),
    Size2 is Size+1,
    add(N, MaxSize, List2, Max2, Size2, ListOut).

parzysteZa(X, [X|L]) :- parzystySize(L).
parzysteZa(X, [_| L]) :-
    parzysteZa(X, L).

max(Max, Max2, N, X) :- ((Max = N; Max > X) , Max2 = Max ) ;
                Max2 is X + 1.

parzystySize(L) :- length(L, X), 0 =:= X mod 2.

jestOk(X, L) :- \+member(X, L) ; (jednokrotnie(X, L), parzysteZa(X, L)).

