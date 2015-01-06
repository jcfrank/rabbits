-module(rabbit).

-export([main/1, count/1, count_tail_recur/1]).

main(Number) ->
        StartTime = now(),
        Result = count(Number),
        Round1 = now(),
        Compare = count_tail_recur(Number),
        Round2 = now(),
        Round1Millis = timer:now_diff(Round1, StartTime),
        Round2Millis = timer:now_diff(Round2, Round1),
        io:format("Result: ~w and ~w ~n", [Result, Compare]),
        io:format("recursive cost: ~B while tail-recursive cost: ~B in microseconds~n", [Round1Millis, Round2Millis]),
        {Round1, Round2, Result}.


% recursive
count(Number) when is_integer(Number) ->
        case Number of 
                N when N =< 2 -> 2;
                N -> 
                        count(N-1) + count(N-3)
                end.

% tail recursive
count_tail_recur(Number) when is_integer(Number) ->
    do_tail_recur(Number, 2, 0, 0).

do_tail_recur(Number, One_month, Two_month, Adults) ->
    case Number of
        N when N =:= 0 ->
            Adults + One_month + Two_month;
        _ ->
            do_tail_recur(Number - 1, Adults, One_month, Adults + Two_month)
    end.

