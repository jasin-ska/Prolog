small(L) :-
	length(L, 4), !,
	between(0, 16, N),
	N mod 7 < 3, nth1(1, L, N),
	S is N + 7, nth1(2, L, S), S < 24,
	W is N + 3, nth1(3, L, W),
	E is N + 4, nth1(4, L, E).

small(L, N) :-
	N < 17,
	N mod 7 < 3, member(N, L),
	S is N + 7, member(S, L), S < 24,
	W is N + 3, member(W, L),
	E is N + 4, member(E, L).

medium(L) :-
	L = [0, 1, 14, 15, 3, 10, 5, 12];
	L = [1, 2, 15, 16, 4, 11, 6, 13];
	L = [7, 8, 21, 22, 10, 17, 12, 19];
	L = [8, 9, 22, 23, 11, 18, 13, 20], !.

big(L) :-
	L = [0, 1, 2, 3, 6, 10, 13, 17, 20, 21, 22, 23], !.


getSet(K, B, M, S, SetOut) :- % Big, Medium, Small
	B>=0, B=<1,
	M>=0, M=<4,
	S>=0, S=<9,
        (B = 1 -> big(Set) ; Set = []), !,
	distinct(add2(Set, M, [], Set2)),
	%draw(Set2),
	countSmalls(Set2, SmallNr),
	SmallNr =< S,
	S2 is S - SmallNr,
	add3(Set2, S2, Set2, Set3, SmallNr),
	length(Set3, LenSet),
        K is 24 - LenSet,
	sort(Set3, SetOut).

zapa³ki(K, B, M, S) :-
	distinct(getSet(K, B, M, S, Set)),
	draw(Set).

add2(Set, 0, Mediums, SetOut) :-
	union(Set, Mediums, Set2),
	sort(Set2, SetOut).

add2(Set, M, Mediums, SetOut) :-
	medium(X),
	\+subset(X, Mediums),
	union(Mediums, X, Mediums2),
	M2 is M - 1,
	add2(Set, M2, Mediums2, SetOut).

add3(Set, 0, Smalls, SetOut, _) :-
	union(Set, Smalls, SetOut).

add3(Set, S, Smalls, SetOut, NowSmalls) :-
	small(X),
	\+subset(X, Smalls),
	union(Smalls, X, Smalls2),
	countSmalls(Smalls2, NowSmalls2),
	R is NowSmalls2 - NowSmalls,
	S2 is S- R,
	add3(Set, S2, Smalls2, SetOut, NowSmalls2).


countSmalls(L, Count) :-
	findall(X, check(L, X), Smalls),
	length(Smalls, Count).

check(L, X) :-
	small(X),
	subset(X, L).



draw(L):-
	foreach(between(0, 23, X), (
	  ((X mod 7 < 3) ->
		(member(X, L) -> mh() ; mhe());
		(member(X, L) -> mv(); mve())),
	  (X mod 7=:= 6 -> newv();true),
	  (X mod 7 =:= 2 -> newh();true)

	)).



newh() :- write("+\n").
newv() :- write("\n").
mh() :- write("+---").
mhe() :- write("+   ").
mv() :- write("|     ").
mve() :- write("      ").


