CB
==

A tool to bookmark command line commands and use them in defined context.

For a bookmark, you define the command, a shortcut and a context.

For example, you may write:
the shortcut 'start', the command 'script/server --debugger' and the context in which the command should run 'test `pwd` = "/Users/home/work/mywebapp"'

as you can see the context is just a bash expression that will be evaluated when you try to run the command.
If you're in the right folder it will execute the command, if you're not nothing happens.

For more command examples please check the cbrc.example file.

You can find

- shell version
- oh-my-zsh plugin version
