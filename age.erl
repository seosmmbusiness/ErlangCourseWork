-module(age).

%% API
-export([getAge/1]).

getAge(Name) ->
  AgeMap = #{"Alice"=> 23, "Bob"=> 43, "Carol" => 29},
  maps:get(Name,AgeMap, -1).