%% @author Interima
%% @version 1.0

%% @doc echo supervisor module
%% starting child with App argument
%% used temporary strategy


-module(echo_supervisor).
-author('interima <interima.x2@gmail.com>').
-export([init/1]).
-export([start_supervisor/1]).
-behavior(supervisor).

%% @doc supervisor start function
start_supervisor(App)->
    supervisor:start_link({local,?MODULE},?MODULE,App).

%% @doc configure and run gen server
init(App) ->
    SuperSpec = {one_for_one, 10, 10},
    ChildSpec =  {echo_gen_server, {echo_gen_server, start_server, [App|[]]}, temporary, 100, worker, [echo_gen_server]},
    {ok, {SuperSpec,[ChildSpec]}}.     