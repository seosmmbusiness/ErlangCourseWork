-module(hw).

%% API
-export([helloworld/0, helloworld/1, hi/0]).

helloworld()->
  "Hello World".

helloworld(X)->
  "Hello " ++ X.

hi()->
  "Hi World".