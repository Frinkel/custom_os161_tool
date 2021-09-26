#!/bin/sh

# This shell script is created by Joel A. V. Madsen, for recompiling the kernel in os161

# Variable declarations
my_src_path=$1
my_root_path=$2

# Get the path to the current directory
my_cur_path=$(pwd)

echo "Do you want to rebuild USERLAND?\ny/n (yes/no)"
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