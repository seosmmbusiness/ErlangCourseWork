%%%-------------------------------------------------------------------
%%% @author Author_Name <Author_Email>
%%% @copyright (C) 2024, Author_Name
%%% @doc 
%%%
%%% @end
%%% Created : 08 Nov 2024 by Author_Name <Author_Email>
%%%-------------------------------------------------------------------
-module(talk).

%% API
-export([run/0, alice/0, bob/2]).

%%%===================================================================
%%% Includes, defines, types and records
%%%===================================================================

%%%===================================================================
%%% API
%%%===================================================================
alice() ->
  receive
    { message, PId } -> 
      io:fwrite("Alice got a mesage\n"),
      PId ! message,
      alice();
    finished -> 
      io:fwrite("Alice is finished\n")
end.

bob(0, PId) -> 
  PId ! finished,
  io:fwrite("Bob is finished\n");
bob(N, PId) ->
   PId ! {message, self()},
  receive
    message -> 
      io:fwrite("Bob got the message\n")
end,
bob(N-1, PId).

run() -> 
  PId = spawn(talk, alice, []),
  spawn(talk, bob, [3, PId]).