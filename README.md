# Custom OS161 Tool (early version)
This is a custom OS161 tool, written in shell, which provides some quality of life actions, making some of the tedious aspects of working with [ OS161 ] a little easier.

## UPDATES 25/09/2021
SSH support should be working! <br/>
<br/>
We have pushed a Linux + Windows version of the local application, this is yet to be tested on a Linux or Windows machine. <br>

## SETUP
Open the config.cfg file, with any text editor, and change the config variables, according to your installation of OS161. <br/>
Your config file should like like the one below:

	setup=local						<- change to your setup type (local or ssh)
	my_ssh_account=yourUBCname@ssh-ubuntu.ece.ubc.ca	<- your SSH remote server connection account
	my_src_path=os161/src					<- change to your path to the source folder
	my_root_path=os161/root					<- change to your path to the root folder
	my_platform=unknown					<- this will be changed automatically

It is worth noting that $HOME or ~/ should NOT be included in the config file! The path should be excluding the home directory.
### NOTE for: Windows/Linux and SSH
When running Linux/Windows and using the local setup or running the remote SSH setup, make sure you're able to open another terminal using the xterm command, try running 'xterm -v', if you have xterm installed you will be prompted your current version. Xterm is used for running the debugger, and without xterm the debug command will be rendered useless.
<br/><br/>
If you're running SSH on a macOS, you can get xterm from [ Xquartz ].

## RUNNING
To run the application, open a Terminal and navigate to the os161_scripts folder, then run the command: 
	
	./run.sh
	
If your're running this command for the first time, you might have to make it executable, by running: 
	
	running chmod +x run.sh

Then type '?' for a list of available commands, you should see something like the output below.

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
The application is, as of now, only tested on a macOS Big Sur, version 11.5.2 and macOS Monterey!

## CREDITS
The tool is developed by Joel August Vest Madsen

## CONTRIBUTING 
If you would like to add to the tool or find a bug, please do send a mail to javm.dev@gmail.com, or make a pull request on GitHub!


[OS161]: http://os161.eecs.harvard.edu/
[Xquartz]: https://www.xquartz.org/
