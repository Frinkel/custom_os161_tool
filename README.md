# Custom OS161 Tool
This is a custom OS161 tool, written in shell, which provides some quality of life actions, making some of the tedious aspects of working with [ OS161 ] a little easier.


## SETUP
Open the config.cfg file, with any text editor, and change the config variables, according to your installation. <br/>
Your config file should like like the one below:

	setup=local						<- Change to your setup type (only local as for now)
	my_ssh_account=yourUBCname@ssh-ubuntu.ece.ubc.ca	<- SSH is currently not supported, so disregard this
	my_src_path=os161/src					<- change to your path to the source folder
	my_root_path=os161/root					<- change to your path to the root folder

It is worth noting that $HOME or ~/ should not be included in the config file! The path should be excluding the home directory.

## RUNNING
To run the application, open a Terminal and navigate to the os161_scripts folder, then run the command: 
	
	./run.sh
	
Then type '?' for a list of available command, you should see something like the output below.

	Running local setup.
	Tool path not found in $PATH, adding it..
	
	Welcome to the OS161 shell script!
	What would you like to do, type "?" for a list of commands.
	Enter a command:
	?
	run = run os161, rec = recompile, db = debug, q = quit
	Enter a command:

Now you're all set, and ready to use the application!

## INFORMATION
The application is, as of now, only tested on a macOS Big Sur, version 11.5.2!

## UPDATES
We are currently working on the support for ssh connection in the application. <br/>
We are currently testing the application on a Windows machine.

## CREDITS
The tool is developed by Joel August Vest Madsen

## CONTRIBUTING 
If you would like to add to the tool or find a bug, please do send a mail to XXX, or make a pull request on GitHub!


[OS161]: http://os161.eecs.harvard.edu/
