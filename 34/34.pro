factorial(0,Result) :-
    Result is 1.
factorial(N,Result) :-
    N > 0,
    M is N-1,
    factorial(M,Next),
    Result is Next*N.

get_digits(Number, Digits) :-
    digit_helper(Number, [], Digits).

digit_helper(0, X, X).
digit_helper(Number, PrevDigits, Digits) :-
    Number > 0,
    Digit is Number mod 10,
    NextNumber is Number // 10,
    digit_helper(NextNumber, [Digit|PrevDigits], Digits).

sum_of_factorials([], 0).
sum_of_factorials([Head|Tail], Sum) :-
    factorial(Head, FactorialOfHead),
    sum_of_factorials(Tail, SumOfTail),
    Sum is FactorialOfHead + SumOfTail.

is_curious(N) :- 
    get_digits(N, Digits),
    sum_of_factorials(Digits, DigitSum),
    DigitSum = N.

only_curious(Out) :-
    numlist(3, 1000000, Inputs),
    include(is_curious, Inputs, Out).

sum_of_list([], 0).
sum_of_list([Head|Tail], Sum) :-
   sum_of_list(Tail, Rest),
   Sum is Head + Rest.

answer_plz(Ans) :-
    only_curious(CuriousNums),
    sum_of_list(CuriousNums, Ans).
