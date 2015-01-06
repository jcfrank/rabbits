#!/usr/bin/env escript

main(_) ->
    {ok, _} = compile:file('rabbit'),
    rabbit:main(20).

