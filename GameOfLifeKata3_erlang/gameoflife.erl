-module(gameoflife).
-export([start/1]).
-include_lib("eunit/include/eunit.hrl").

% Helpers
to_set(Collection) ->
  if is_list(Collection) -> sets:from_list(Collection);
  true -> Collection
  end.

to_list(Collection) ->
  if is_list(Collection) -> Collection;
  true -> sets:to_list(Collection)
  end.

% Game of Life logic
vicinity({X,Y}) ->
  [{X1,Y1} || X1 <- [X-1, X, X+1], Y1 <- [Y-1, Y, Y+1]].
  
neighbours(C) ->
  lists:delete(C, vicinity(C)).

should_cell_survive(C, Cells) ->
  N = length(lists:filter(fun(C1) -> sets:is_element(C1, Cells) end, neighbours(C))),
  (N == 3) or ((N == 2) and sets:is_element(C, Cells)).

evolve(RawCells) ->
  Cells = to_set(RawCells),
  AffectedCells = lists:flatmap(fun(C) -> vicinity(C) end, sets:to_list(Cells)),
  AliveCells = lists:filter(fun(C) -> should_cell_survive(C, Cells) end, AffectedCells),
  sets:from_list(AliveCells).

% Simulation code
print_world(RawCells, GenerationNo) ->
  Cells = to_set(RawCells),
  Width = 20,
  Height = 10,
  io:format("Generation ~p", [GenerationNo]),
  Text = lists:map(
    fun(Y) ->
      [$\n|[
        if (IsAlive) -> $#; true -> $. end ||
        IsAlive <- [sets:is_element({X,Y}, Cells) || X <- lists:seq(1,Width)]
      ]]
    end, lists:seq(1,Height)),
  io:format("~s~n~n", [Text]).

run_simulation(Cells, GenerationNo, Count) ->
  print_world(Cells, GenerationNo),
  case GenerationNo of
    Count -> ok;
    C -> 
      NewCells = evolve(Cells),
      run_simulation(NewCells, C+1, Count)
  end.

run_simulation(Cells, Count) ->
  run_simulation(Cells, 0, Count).

start(GenerationCount) ->
  Width = 20,
  Height = 10,
%  Cells = sets:from_list([{2,2},{3,3},{2,3},{7,7},{10,5},{10,6},{10,7}]),
  Cells = [{random:uniform(Width), random:uniform(Height)} || _ <- lists:seq(1,50)],
  run_simulation(Cells, GenerationCount).

% Test code
-define(assertSetEqual(L1, L2), ?assertEqual(lists:sort(to_list(L1)), lists:sort(to_list(L2)))).
-define(_assertSetEqual(L1, L2), ?_test(?assertSetEqual(L1, L2))).

gol_test_() ->
  [
    ?_assertSetEqual([], evolve([]) ),
    ?_assertSetEqual([{2,2}], evolve([{1,1},{2,2},{3,3}]) ),
    ?_assertSetEqual([{1,2},{2,2},{3,2}], evolve([{2,1},{2,2},{2,3}]) ),
    ?_assertSetEqual([{2,2},{2,3},{3,2},{3,3}], evolve([{2,2},{2,3},{3,2},{3,3}]) )
  ].
