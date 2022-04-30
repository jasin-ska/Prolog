% open("ex1.prog", read, X), scanner(X, Y), close(X), write(Y).

sepChars("\n \t;").

scanner(Input, List) :-
    processFile(Input, [], List), !.

processFile(Input, List, ListOut) :-
    sepChars(Seps),
    read_string(Input, Seps, "", Sep, String),
    (String \= "" ->
          addToken(String, List, List2);
          List2 = List),
    (Sep =:= 59 -> addToken(";", List2, List3) ; List3 = List2),
    ((Sep =:= -1, ListOut = List);
    processFile(Input, List3, ListOut)).

addToken(String, List, List2) :-
    token(String, Token),
    append(List, Token, List2).

token(String, [Token]) :-
    (key(String), atom_string(At, String), Token = key(At), !);
    (sep(String), atom_string(At, String), Token = sep(At), !);
    (number_string(Nr, String), integer(Nr), Nr>=0, Token = int(Nr), !);
    (id(String), Token = id(String), !).


id(String) :-
    string_upper(String, String).

key("read").
key("write").
key("if").
key("then").
key("else").
key("fi").
key("while").
key("do").
key("od").
key("and").
key("or").
key("mod").

sep(";").
sep("+").
sep("-").
sep("*").
sep("/").
sep("(").
sep(")").
sep("<").
sep(">").
sep("=").
sep("/=").
sep("=<").
sep(">=").
sep(":=").
