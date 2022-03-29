maxSum(L, BestSum) :-
    maxSum(L, BestSum, 0, 0).

% maxSum(Lista, BestSum, CurrBestSum, CurrSum).

maxSum([], X, X, _).
maxSum([X|L], BestSum, CurrBestSum, CurrSum) :-
    (CurrSum + X > 0 ->
         CurrSum2 is CurrSum + X;
         CurrSum2 is 0),
    (CurrBestSum > CurrSum2 ->
         CurrBestSum2 is CurrBestSum;
         CurrBestSum2 is CurrSum2),
    maxSum(L, BestSum, CurrBestSum2, CurrSum2).
