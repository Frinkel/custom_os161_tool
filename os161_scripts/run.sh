#!/bin/sh
echo "\033]0;OS161 Tool - by JM\007"

# Load the config library
source config_reader.sh;

setup=$"$(config_get setup)"



if [[ $setup == "local" ]]; 
then
	echo "Running "$setup" setup."
	sh ./local/local.sh
elif [[ $setup == "ssh" ]]; 
then
	echo "Running "$setup" setup."
	#ssh $(config_get my_ssh_account) 'bash -s' < ./ssh.sh
	#sh ssh.sh
fi