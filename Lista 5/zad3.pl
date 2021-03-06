% browse(f1(f2(a2, a3), a1, f3(a4))).

browse(Node):-
    browse(Node, [], []).

browse(CurrNode, LeftSib, RightSib):-
    writeln(CurrNode),
    write('command: '),
    read(Cmd),
    inCmd(Cmd, CurrNode),
    npCmd(Cmd, CurrNode, LeftSib, RightSib, MatchedNP),
    outCmd(Cmd, CurrNode, LeftSib, RightSib, MatchedNP).


inCmd(Cmd, CurrNode) :-
    ((in(Cmd),
     CurrNode =..[_, CurrNode1 | RightSib1],
     browse(CurrNode1, [], RightSib1), !
    ); true).

npCmd(Cmd, CurrNode, LeftSib, RightSib, MatchedNP) :-
        (next(Cmd),
        RightSib = [Next|RightSib2],
        MatchedNP is 1,
        append([CurrNode], LeftSib, LeftSib2),
        browse(Next, LeftSib2, RightSib2), !);
        prevCmd(Cmd, CurrNode, LeftSib, RightSib, MatchedNP).

prevCmd(Cmd, CurrNode, LeftSib, RightSib, MatchedNP) :-
        (prev(Cmd),
        LeftSib = [Prev|LeftSib2],
        MatchedNP is 1,
        append([CurrNode], RightSib, RightSib2),
        browse(Prev, LeftSib2, RightSib2), !);
        MatchedNP is 0.

outCmd(Cmd, CurrNode, LeftSib, RightSib, MatchedNP) :-
    (out(Cmd); MatchedNP = 1, !);
    browse(CurrNode, LeftSib , RightSib).

in(i).
out(o).
next(n).
prev(p).
