{application, echo,
[{description, "Echo Gui Server"},
{vsn, "1.0"},
{modules, [echo_gen_server, echo_supervisor, echo_app, echo]},
{registered, [echo, echo_supervisor]},
{applications, [kernel, stdlib]},
{env, [{gui_name, "client_gui.py"}]},
{mod, {echo_app,[]}}]}.
