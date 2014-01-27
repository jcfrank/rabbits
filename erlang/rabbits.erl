-module(rabbits).
-export([main/0]).

main() ->
    Count = count_rabbits(1),
    io:fwrite("Month 1, rabbits ~w~n", [Count]),
    Count2 = count_rabbits(17),
    io:fwrite("Month 17, rabbits ~w~n", [Count2]),
    Count3 = count_rabbits(24),
    io:fwrite("Months 24, rabbits ~w~n", [Count3]),
    Count4 = count_rabbits(33),
    io:fwrite("Months 33, rabbits ~w~n", [Count4]).

count_rabbits(Months) ->
    count_rabbits(Months, 2, 0, 0, 0).

count_rabbits(Months, New, M1, M2, Adult) when Months > 0 ->
    count_rabbits(Months - 1, M2 + Adult, New, M1, M2 + Adult);

count_rabbits(0, New, M1, M2, Adult) ->
    New + M1 + M2 + Adult.

