%%%-------------------------------------------------------------------
%%% @author anast
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. февр. 2020 12:04
%%%-------------------------------------------------------------------
-module(laba1).
-author("anast").


%% API
-export([start/0]).
init()->[
  [],
  [2,3,2,5,6,3,3,9,5,9,33,1,2,5],
  [],
  [1,6,4,5,9,33,43,2,6,7,7,2,2,2,2,2,2,1,2,5],
  []
  %[]
].
start()-> erlang:display(collision(init())).

collision([H|T])->
  if
    T == [] -> H;
    true -> array_collision1(H,collision(T))
  end.

array_collision1(A,B) -> array_collision(A,B,[]).

array_collision([], _, Result)->Result;
array_collision( _, [], Result)->Result;
array_collision([H|T], Arr, Result) ->
  case lists:member(H,Arr) of
    true -> array_collision(T,lists:delete(H,Arr),Result ++ [H]);
    false -> array_collision(T,Arr,Result)
  end.