perm([], [], 0).
perm(L1, [X | L3], SumIdx) :-
   select(X, L1, L2),
   %id[X] to liczba nieporzadkow
   perm(L2, L3, SumIdx2),
   nth0(Idx, L1, X),
   SumIdx is SumIdx2 + Idx.

even_permutation(Xs, Ys) :-
   perm(Xs, Ys, SumIdx),
   0 =:= SumIdx mod 2.

odd_permutation(Xs, Ys) :-
   perm(Xs, Ys, SumIdx),
   1 =:= SumIdx mod 2.
