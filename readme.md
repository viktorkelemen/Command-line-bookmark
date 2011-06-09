CB
==

Tool to bookmark command line commands and use them in the defined context.

Let's say you want to define a shortcut to start the server of your app,

you write the following:
the shortcut 'start', the command 'script/server --debugger' and the context in which the command should run 'test `pwd` = "/Users/home/work/mywebapp"'

this is in one line, shortcut, command, context

start,script/server,test `pwd` = "/Users/home/work/mywebapp"'

as you can see the context is just a bash expression that will be evaluated when you try to run the command.
If you're in the right folder it will execute the command, if you're not nothing happens.

For more command examples please check the clibookmark.commands.example file.