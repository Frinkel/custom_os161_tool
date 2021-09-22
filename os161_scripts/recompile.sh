#!/bin/sh

# This shell script is created by Joel A. V. Madsen, for recompiling the kernel in os161


# Variable declarations
my_src_path=$1
my_root_path=$2

# Get the path to the current directory
my_cur_path=$(pwd)

echo "Do you wan to rebuild USERLAND?\ny/n (yes/no)"
read answr

if [ $answr == "y" ]
then
	cd; cd $my_src_path
	bmake -j2
	bmake install
fi


echo "Starting recompile.."

# Change directory
cd; cd $my_src_path

# Configure the kernel
cd "kern/conf"
./config DUMBVM

cd "../"

# Recompile and recopy OS161 root
cd "compile/DUMBVM"
bmake depend
bmake -j2 # You can change the number 2 to the number of cores you have, to make bmake run faster
bmake install

echo "\nDone compiling."

echo "\n"
echo "Do you wish to boot the OS? \ny, n or d? (yes, no or debug)"
read answr


# If statement for answer
if [ $answr == "y" ] # run OS161
then
	cd; cd $my_root_path
	sys161 kernel

elif [[ $answr == "d" ]] # DEBUG MODE
then
	cd $my_cur_path
	echo $my_src_path"\n"$my_root_path > pipe.txt

	open -a Terminal debug_terminal.sh # Don't know if this works on windows!

	cd; cd $my_root_path
	sys161 -w kernel
	
else
	echo "OK, bye!"
fi