#!/bin/sh

# Get the config file
. ./config_reader.sh;
config_file=config.cfg
my_ssh_account=$"$(cfg_read $config_file my_ssh_account)"

cp config.cfg ./ssh
cp config_reader.sh ./ssh
cp recompile.sh ./ssh
scp -r ssh $my_ssh_account:~
cd ./ssh
rm config.cfg
rm config_reader.sh
rm recompile.sh