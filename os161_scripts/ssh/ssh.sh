#!/bin/sh

# This shell script is created by Joel A. V. Madsen, for executing actions to the OS161

# Change Terminal name
#echo "\033]0;OS161 Tool - by JM\007"

# Variable declarations
# Change the directory to your source os161 source folder, default is your home directory.
#my_src_dir="$HOME/documents/github/os161/os161/src" # Might want to edit this!
#my_root_dir="$HOME/os161/root"						# Might want to edit this!


echo "WORKS!!!"

exit

# Load the config library
source config_reader.sh;

my_src_path=$HOME"/""$(config_get my_src_path)"
my_root_path="$HOME""/""$(config_get my_root_path)"
#my_ssh_account=$"$(config_get my_ssh_account)"

#ssh nesdam@ssh-ubuntu.ece.ubc.ca << EOF
#pwd
#echo "Im in!"
#EOF

exit

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
echo "What would you like to do? ? for a list of commands."

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
		#ssh nesdam@ssh-ubuntu.ece.ubc.ca



#		echo "FIN!"
#		exit
		cd $my_root_path
		sys161 kernel
		func
	;;
	"rec")
		sh ./recompile.sh $my_src_path $my_root_path
	;;
	"db")
		cd $my_cur_path

		open -a Terminal debug_terminal.sh # Don't know if this works on windows!

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