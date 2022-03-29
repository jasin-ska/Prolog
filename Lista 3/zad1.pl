sum([], 0).
sum([X|L], Sum) :-
   sum(L, Rest),
   Sum is X + Rest.

avg(List, Avg):-
    sum(List, Sum),
    length(List, Length),
    Avg is Sum / Length.

variance(L, Var) :-
    avg(L, Avg),
    length(L, Length),
    varianceTimesN(L, Avg, 0, Var2),
    Var is Var2/Length.

varianceTimesN([], _, X, X).
varianceTimesN([X| L], Avg, CurrVar, TotalVar) :-
    CurrVar2 is ((X - Avg)*(X - Avg) + CurrVar),
    varianceTimesN(L, Avg, CurrVar2, TotalVar).
