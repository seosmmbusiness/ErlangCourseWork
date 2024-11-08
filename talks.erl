
-module(talks).

%% API
-export([run/0, alice/0, bob/1]).

alice() ->
  receive
    message -> 
      io:fwrite("Alice got a mesage\n"),
      bob ! message,
      alice();
    finished -> 
      io:fwrite("Alice is finished\n")
  end
.

bob(0) -> 
  alice ! finished,
  io:fwrite("Bob is finished\n");

bob(N) ->
   alice ! message,

  receive
    message -> 
      io:fwrite("Bob got the message\n")
  end,
  bob(N-1).

run() -> 
  register(alice, spawn(talks, alice, [])),
  register(bob, spawn(talks, bob, [3])).