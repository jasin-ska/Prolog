%dom(Kraj, Kolor, Pali, Pije, Zwierze) - element listy Domy

rybki(Kto) :- % 1,652 interferences
    % 5 domow
    length(Domy, 5),
    % zasada 1
    nth1(1, Domy, dom(norweg, _, _, _, _)),
    % zasada 8
    nth1(3, Domy, dom(_, _, _, mleko, _)),
    % zasada 12
    obok(dom(norweg, _, _, _, _), dom(_, niebieski, _, _, _), Domy),
    % zasada 3
    przed(dom(_, zielony, _, _, _), dom(_, bia造, _, _, _), Domy),
    % zasada 15
    member(dom(_, zielony, _, kawa, _), Domy),
    % zasada 2
    member(dom(anglik, czerwony, _, _, _), Domy),
    % zasada 4
    member(dom(du鎍zyk, _, _, herbata, _), Domy),
    % zasada 11
    member(dom(szwed, _, _, _, psy), Domy),
    % zasada 5
    obok(dom(_, _, light, _, _), dom(_, _, _, _, koty), Domy),
    % zasada 6
    member(dom(_, 鄴速y, cygara, _, _), Domy),
    % zasada 7
    member(dom(niemiec, _, fajka, _, _), Domy),
    % zasada 9
    obok(dom(_, _, light, _, _), dom(_, _, _, woda, _), Domy),
    % zasada 10
    member(dom(_, _, bezFiltra, _, ptaki), Domy),
    % zasada 13
    obok(dom(_, _, _, _, konie), dom( _, 鄴速y, _, _, _), Domy),
    % zasada 14
    member(dom(_, _, mentol, piwo, _), Domy),
    % Kto hoduje rybki?
    member(dom(Kto, _, _, _, rybki), Domy), !.


obok(X, Y, L) :-
    przed(X, Y, L);
    przed(Y, X, L).

przed(X, Y, L) :-
    nth1(Nr, L, X),
    Nr2 is Nr + 1,
    nth1(Nr2, L, Y).

rybki0(Kto) :-  % 19 tys interferences
    % 5 domow
    length(Domy, 5),
    % zasada 1
    nth1(1, Domy, dom(norweg, _, _, _, _)),
    % zasada 2
    member(dom(anglik, czerwony, _, _, _), Domy),
    % zasada 3
    przed(dom(_, zielony, _, _, _), dom(_, bia造, _, _, _), Domy),
    % zasada 4
    member(dom(du鎍zyk, _, _, herbata, _), Domy),
    % zasada 5
    obok(dom(_, _, light, _, _), dom(_, _, _, _, koty), Domy),
    % zasada 6
    member(dom(_, 鄴速y, cygara, _, _), Domy),
    % zasada 7
    member(dom(niemiec, _, fajka, _, _), Domy),
    % zasada 8
    nth1(3, Domy, dom(_, _, _, mleko, _)),
    % zasada 9
    obok(dom(_, _, light, _, _), dom(_, _, _, woda, _), Domy),
    % zasada 10
    member(dom(_, _, bezFiltra, _, ptaki), Domy),
    % zasada 11
    member(dom(szwed, _, _, _, psy), Domy),
    % zasada 12
    obok(dom(norweg, _, _, _, _), dom(_, niebieski, _, _, _), Domy),
    % zasada 13
    obok(dom(_, _, _, _, konie), dom( _, 鄴速y, _, _, _), Domy),
    % zasada 14
    member(dom(_, _, mentol, piwo, _), Domy),
    % zasada 15
    member(dom(_, zielony, _, kawa, _), Domy),
    % Kto hoduje rybki?
    member(dom(Kto, _, _, _, rybki), Domy).

