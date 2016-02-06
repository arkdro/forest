-module(count_trees_SUITE).

-include_lib("eunit/include/eunit.hrl").
-include_lib("common_test/include/ct.hrl").

-define(ASSERT, true).

-compile([export_all]).

suite() ->
    [
     {timetrap, {seconds, 180}}
    ].

all() ->
    [
     {group, all}
    ].

groups() ->
    [
     {all, [], [
                {group, checks}
               ]},
     {checks, [], [
                   check_ok1,
                   check_cycle,
                   check_empty_forest
                  ]}
    ].

init_per_suite(Config) ->
    Config.

end_per_suite(_Config) ->
    ok.

check_ok1(_) ->
    V = lists:seq(0, 9),
    E = [{1, 2}, {3, 4}, {3, 5}, {4, 5}, {6, 7}, {6, 8}, {6, 9}],
    Forest = forest:build_forest(V, E),
    Act = forest:count_trees(Forest),
    Exp = 3,
    ?assertEqual(Exp, Act).

check_cycle(_) ->
    V = lists:seq(3, 5),
    E = [{3, 4}, {3, 5}, {4, 5}],
    Forest = forest:build_forest(V, E),
    Act = forest:count_trees(Forest),
    Exp = 0,
    ?assertEqual(Exp, Act).

check_empty_forest(_) ->
    V = [],
    E = [],
    Forest = forest:build_forest(V, E),
    Act = forest:count_trees(Forest),
    Exp = 0,
    ?assertEqual(Exp, Act).

