=======================================
EchoServer for Linux
=======================================
Description:

  EchoServer is simple application to echo all request 
  of client gui through erlang gen server

Requirements:

  Erlang R15B01 (http://www.erlang.org/download.html)
  Python 2.7.2 
  PyQt 4.8.4 (or later)

Install:

  EchoServer does not need installation

Run:

  To run EchoServer exec run.sh from EchoServer directory

Uninstalling:

  EchoServer does not need uninstallation

Some Problems and Solutions:

  problem: error "Permission denied"
  solution: exec "chmod a+x run.sh" or exec "sh run.sh"

  problem: error erl: command not found
  solution: install Erlang and check you PATH variable

  problem: error "{"init terminating in do_boot",{'cannot load',error_handler,get_file}}"
  solution: install correct version of Erlang

  problem: error "./run.sh: No such file or directory"
  solution: cd in directory where located run.sh and do ./run.sh in shell

  problem: error "*/EchoProject/echo-1.0/priv/client_gui.py: Permission denied"
  solution: exec "chmod a+x client_gui.py" (in priv directory) or
	    exec "chmod a+x echo-1.0/priv/client_gui.py" (in priv directory) or
	    exec "run_fix.sh" (or "sh run_fix.sh") instead of these

