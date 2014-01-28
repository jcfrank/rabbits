-module(rabbit).

-export([main/1, count/1]).

main(Number) ->
        StartTime = now(),
        Result = count(Number),
        EndTime = now(),
        TimeDiff = timer:now_diff(EndTime, StartTime)/1000000,
        {TimeDiff, Result}.
    


count(Number) when is_integer(Number) ->
        case Number of 
                0 -> 2;
                1 -> 2;
                2 -> 2;
                N -> 
                        count(N-1) + count(N-3)
                end.

