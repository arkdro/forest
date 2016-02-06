-module(forest).

-export([
         count_trees/1
        ]).

count_trees(G) ->
    Components = digraph_utils:components(G),
    L = [digraph_utils:subgraph(G, X) || X <- Components],
    L2 = [1 || X <- L, digraph_utils:is_tree(X)],
    length(L2).

%% ===================================================================
%% Internal functions
%% ===================================================================

