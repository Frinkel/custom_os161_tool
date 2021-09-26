#!/bin/sh

# This shell script is created by Joel A. V. Madsen, for debugging the kernel in os161

# Change Terminal name
echo -n -e "\033]0;OS161 Debug View\007"


# The following pipe.txt, is a hacky solution to pass arguments to the 
# new terminal, created when we want to debug OS161

script_path=$(dirname "$0")
cd $script_path; cd ../

# Read from config
source config_reader.sh;
config_file=config.cfg

my_src_path=$HOME"/""$(cfg_read $config_file my_src_path)"
my_root_path="$HOME""/""$(cfg_read $config_file my_root_path)"


# Check if $PATH holds the tool path needed to run the OS
# You might want to edit the path, if your tools are not located in ~/tools, as per default!
tool_path="$HOME/tools/sys161/bin:$HOME/tools/os161/bin"


if [[ $PATH == *$tool_path* ]]; then
	echo "Tool path found in \$PATH!"
else
	echo "Tool path not found in \$PATH, adding it.."
	export PATH="$HOME/tools/sys161/bin:$HOME/tools/os161/bin:$PATH"
fi

# Run GDB
cd; cd $my_root_path
os161-gdb kernel -ex 'target remote unix:.sockets/gdb'

osascript -e 'tell application "Terminal" to close (every window whose name contains "OS161 Debug View")' &