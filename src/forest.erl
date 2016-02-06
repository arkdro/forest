-module(forest).

-export([
         build_forest/2,
         count_trees/1
        ]).

build_forest(Vs, Es) ->
    G = digraph:new(),
    [digraph:add_vertex(G, V) || V <- Vs],
    [digraph:add_edge(G, E, V1, V2, []) || {V1, V2} = E <- Es],
    G.

count_trees(G) ->
    Components = digraph_utils:components(G),
    L = [digraph_utils:subgraph(G, X) || X <- Components],
    L2 = [1 || X <- L, digraph_utils:is_tree(X)],
    length(L2).

%% ===================================================================
%% Internal functions
%% ===================================================================

