#!/bin/sh

# This shell script is created by Joel A. V. Madsen, for executing actions to the OS161


# Load the config library
source config_reader.sh;

my_src_path=$HOME"/""$(config_get my_src_path)"
my_root_path="$HOME""/""$(config_get my_root_path)"


# You might want to edit the path, if your tools are not located in ~/tools, as per default!
tool_path="$HOME/tools/sys161/bin:$HOME/tools/os161/bin"

# Check if $PATH holds the tool path needed to run the OS
if [[ $PATH == *$tool_path* ]]; then
	echo "Tool path found in \$PATH!\n"
else
	echo "Tool path not found in \$PATH, adding it..\n"
	export PATH="$HOME/tools/sys161/bin:$HOME/tools/os161/bin:$PATH"
fi

# Get the path to the current directory
my_cur_path=$(pwd)

echo "Welcome to the OS161 shell script!"
echo "What would you like to do? \"?\" for a list of commands."

func()
{
	echo "Enter a command:"
    read cmd

    case $cmd in
	"?")
		echo "run = run os161, rec = recompile, db = debug, q = quit"
		func
	;;
	"run")
		cd $my_root_path
		sys161 kernel
		func
	;;
	"rec")
		sh ./recompile.sh $my_src_path $my_root_path
	;;
	"db")
		cd $my_cur_path

		open -a Terminal ./local/debug_terminal.sh # Don't know if this works on windows!

		cd $my_root_path 
		sys161 -w kernel

		func
	;;
	"q")
		echo "Quitting, bye!"
		exit
	;;
	*)
		echo "Invalid command!"
		func 
	;;
	esac
}

func $cmd

exit