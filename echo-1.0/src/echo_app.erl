%% @author Interima
%% @version 1.0

%% @doc Application module
%% export two main function to start and stop application
%% run supervisor with App argument which is getting
%% from enviroment

-module(echo_app).
-behavior(application).
-export([start/2,stop/1]).
-author('interima <interima.x2@gmail.com>').

%% @doc Application start function
start(_,_)->	
	PrivDir = code:priv_dir(echo),
	{ok,App} = application:get_env(gui_name),
	echo_supervisor:start_supervisor(filename:join([PrivDir,App])).

%% @doc Application stop function
stop(_)->ok.

