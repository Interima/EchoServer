%% @author Interima
%% @version 1.0

%% @doc echo gen_server module
%% create port to external App
%% and bind it. Redirect input data to output as "echo"

-module(echo_gen_server).
-author('interima <interima.x2@gmail.com>').
-export([init/1,terminate/2,handle_info/2]).
-export([start_server/1]).
-behavior(gen_server).

-record(state,{port}).

%% @doc gen server starting function
start_server(App)->
	io:fwrite("starting gen server...~n"),
	gen_server:start_link({local,?MODULE},?MODULE,App,[]).

%% @doc init callback function
init(App)->
	%% @doc monitor childs exiting and open port to external programm
	process_flag(trap_exit,true),
	Port = create_port_to(App),
	{ok,#state{port=Port}}.


%% @doc echo callback function
handle_info({Port,{data,{_,Data}}},State)->
	port_command(Port,[Data|<<"\n">>]),
	{noreply,State};
	

%% @doc handle external programm has been normal exited
handle_info({_,{exit_status,0}},State)->
	{stop,normal,State};

%% @doc handle error when external programm has been exited
handle_info	({_,{exit_status,Status}},State)->
	{stop,Status,State}.

%% @doc terminating gen server when normal exit
terminate(normal,_)->
	io:fwrite("normal exit...~n");

%% @doc terminate gen server when error exit signal
terminate(_,State)->
	%% @doc trying to close port
	io:fwrite("error...~n"),
	io:fwrite("trying to close port...~n"),
	port_close(State#state.port).

%% @doc create port function
create_port_to(App)->
	io:fwrite("opening port...~n"),
	open_port({spawn,App},[{line,1000},exit_status,use_stdio,binary]).
