#!/bin/sh

# This shell script is created by Joel A. V. Madsen, for executing actions to the OS161

# Change Terminal name
#echo "\033]0;Remote OS161 Tool - by JM\007"

. ./config_reader.sh;
config_file=config.cfg

my_src_path=$HOME"/""$(cfg_read $config_file my_src_path)"
my_root_path=$HOME"/""$(cfg_read $config_file my_root_path)"

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
		echo "run = run os161, rec = recompile, db = debug, rem_rei = reinstall the remote tool, q = quit"
		func
	;;
	"run")
		cd $my_root_path
		sys161 kernel
		func
	;;
	"rec")
		export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/addedlibs"
		sh ./recompile.sh $my_src_path $my_root_path
		func
	;;
	"db")
		cd $my_root_path 

		# Open a new terminal for debugging
		DISPLAY=127.0.0.1:10.0 
		nohup xterm -e "os161-gdb kernel -ex 'target remote unix:$HOME/os161/root/.sockets/gdb'" &

		# Run the OS and wait for the debugger
		sys161 -w kernel

		func
	;;
	"rem_rei")
		echo "Running a reinstall of the remote custom OS161 tool!"
		exit 222
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