%%% @author Author_Name <Author_Email>
%%% @copyright (C) 2024, Author_Name
%%% @doc 
%%%
%%% @end
%%% Created : 08 Nov 2024 by Author_Name <Author_Email>
-module(hof).

-export([double/0]).

double()->
F = fun(X) -> (X - 32) * 5/9 end,
map(F,[1,5,2,7,4,6]).

map(F,[])->
  [];
map(F, [First | Rest]) -> 
  [float(F(First)) | map(F,Rest)].