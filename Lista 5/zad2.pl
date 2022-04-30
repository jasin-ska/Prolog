% board([1, 3, 5, 4, 4, 2]).
% hetmany(6, X), board(X).

board(L) :-
    length(L, N),
    biggerLoop(L, N, N).

biggerLoop(L, I, N) :-
    I = 0,
    horzLoop(L, 1, N, 1, 1), !.
biggerLoop(L, I, N) :-
    horzLoop(L, 1, N, I, 1),
    horzLoop(L, 1, N, I, 2),
    horzLoop(L, 1, N, I, 3),
    I2 is I - 1,
    !, biggerLoop(L, I2, N).

horzLoop(_, I, N, _, Line) :-
    I > N,
    (Line = 1 -> write("+"); write("|")),
    write("\n"), !.
horzLoop(L, I, N, Row, Line) :-
    nth1(I, L, Hetman),
    (I mod 2 =:= Row mod 2 ->
           (Row = Hetman -> ciemneZajete(Line); ciemnePuste(Line));
           (Row = Hetman -> jasneZajete(Line); jasnePuste(Line))
    ),
    I2 is I + 1,
    !, horzLoop(L, I2, N, Row, Line).



ciemneZajete(Line) :-
    (Line = 1, write("+-----"));
    (Line = 2, write("|:###:"));
    (Line = 3, write("|:###:")).

jasneZajete(Line) :-
    (Line = 1, write("+-----"));
    (Line = 2, write("| ### "));
    (Line = 3, write("| ### ")).

ciemnePuste(Line) :-
    (Line = 1, write("+-----"));
    (Line = 2, write("|:::::"));
    (Line = 3, write("|:::::")).

jasnePuste(Line) :-
    (Line = 1, write("+-----"));
    (Line = 2, write("|     "));
    (Line = 3, write("|     ")).
