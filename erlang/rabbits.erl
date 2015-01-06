-module(rabbits).
-export([main/1]).

main(Number) ->
    Start = now(),
    Result = count_rabbits(Number),
    End = now(),
    TimeDiff = timer:now_diff(End, Start)/1000000,
    io:format("Result: ~w~n", [Result]),
    {TimeDiff, Result}.

% this is the same as tail recursive version
count_rabbits(Months) ->
    count_rabbits(Months, 2, 0, 0, 0).

count_rabbits(Months, New, M1, M2, Adult) when Months > 0 ->
    count_rabbits(Months - 1, M2 + Adult, New, M1, M2 + Adult);

count_rabbits(0, New, M1, M2, Adult) ->
    New + M1 + M2 + Adult.

