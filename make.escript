#!/usr/bin/env escript
-export([main/1]).

main([Path]) ->
code:add_path(Path),
systools:make_script("echo",[local]).
