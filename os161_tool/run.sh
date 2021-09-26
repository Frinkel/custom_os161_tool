#!/bin/sh
echo "\033]0;OS161 Tool - by JM\007"

# Load the config library
source config_reader.sh;
config_file=config.cfg

setup=$"$(cfg_read $config_file setup)"


case $OSTYPE in
	'darwin'*)
		cfg_write $config_file my_platform macOS
	;;
	'linux-gnu'*)
		cfg_write $config_file my_platform linux
	;;
	'cygwin') # Linux emulator for Windows
		cfg_write $config_file my_platform linux
	;;
	'msys') # Shell and GNU utilities compiled for Windows 
		cfg_write $config_file my_platform linux
	;;
esac
my_platform=$(cfg_read $config_file my_platform)

echo "Running "$setup" setup."
if [[ $setup == "local" ]]; 
then
	if [[ $my_platform == "macOS" ]]; then
		sh ./local/mac_local.sh
	elif [[ $my_platform == "linux" ]]; then
		sh ./local/linux_local.sh
	fi

elif [[ $setup == "ssh" ]]; 
then
	my_ssh_account=$"$(cfg_read $config_file my_ssh_account)"

	ssh_setup_login()
		{

		if [[ $(head -n 1 init/ssh_init.txt) == 0 ]]; then
			echo SSH first time setup.
			sh init/ssh_init.sh
			
			if [[ $? == 0 ]]; 
			then
				echo 1 > init/ssh_init.txt
			fi

			ssh -t -X $my_ssh_account 'export PATH="~/bin:~/.local/bin:/ubc/ece/home/af/other/os161/tools/sys161/bin:/ubc/ece/home/af/other/os161/tools/os161/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"; cd ssh; chmod +x ssh.sh; chmod +x config_reader.sh ; ./ssh.sh'
			
			else
			ssh -t -X $my_ssh_account 'export PATH="~/bin:~/.local/bin:/ubc/ece/home/af/other/os161/tools/sys161/bin:/ubc/ece/home/af/other/os161/tools/os161/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"; cd ssh; ./ssh.sh'
		
		fi

		# Check error code from ssh session
		if [[ $? == 222 ]]; then
			echo 0 > init/ssh_init.txt
			ssh_setup_login
		fi
	}

	ssh_setup_login
fi