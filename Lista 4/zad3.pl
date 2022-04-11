small(L) :-
	length(L, 4), !,
	between(0, 16, N),
	N mod 7 < 3, nth1(1, L, N),
	S is N + 7, nth1(2, L, S), S < 24,
	W is N + 3, nth1(3, L, W),
	E is N + 4, nth1(4, L, E).

medium(L) :-
	L = [0, 1, 14, 15, 3, 10, 5, 12];
	L = [1, 2, 15, 16, 4, 11, 6, 13];
	L = [7, 8, 21, 22, 10, 17, 12, 19];
	L = [8, 9, 22, 23, 11, 18, 13, 20], !.

big(L) :-
	L = [0, 1, 2, 3, 6, 10, 13, 17, 20, 21, 22, 23], !.


zapa³ki(K, B, M, S) :- % Big, Medium, Small
	between(0, 1, B),
	between(0, 4, M),
	between(0, 9, S),
	between(0, 24, K),
        (B = 1 -> big(Set) ; Set = []),
	add2(Set, M, [], Set2),
	%length(Mediums, M),
	%foreach(member(Mediums, X), medium(X)),
	%is_set(Mediums),
	%add(1, Mediums, M, Set, Set2),
	draw(Set2).

%zapa³ki(K, B, M, S, []).

add2(Set, 0, Mediums, SetOut) :-
	union(Set, Mediums, SetOut).

add2(Set, M, Mediums, SetOut) :-
	medium(X),
	intersection(X, Mediums, Inter),
	\+(Inter = X), % juz dodany
	union(Mediums, X, Mediums2),
	M2 is M - 1,
	add2(Set, M2, Mediums2, SetOut).


add(Id, Squares, Length, Set, SetOut) :-
	(Id > Length -> SetOut = Set; true),
	nth1(Id, Squares, X),
	union(X, Set, Set2),
	Id2 is Id + 1,
	add(Id2, Squares, Length, Set2, SetOut).

checkSmalls(Set) :-
	Smalls = [].
	%foreach(member(Set, X).


%zapa³ki(K, B, M, S, Set) :-
%	(B = 1 -> union())



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


%
%medium(L) :-
%	length(L, 8),
%	between(0, 23, N1),
%	N1 mod 7 < 2, nth1(1, L, N1),
%	N2 is N1 + 1, nth1(2, L, N2),
%	S1 is N1 + 14, nth1(3, L, S1),
%	S2 is N1 + 15, nth1(4, L, S2),
%	W1 is N1 + 3, nth1(5, L, W1),
%	W2 is N1 + 10, nth1(6, L, W2),
%	E1 is N2 + 4, nth1(7, L, E1),
%	E2 is N2 + 11, nth1(8, L, E2),
%	foreach(member(X, L), between(0, 23, X)).

