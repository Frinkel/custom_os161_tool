#!/bin/sh

cp config.cfg ./ssh
cp config_reader.sh ./ssh
cp recompile.sh ./ssh
scp -r ssh nesdam@ssh-ubuntu.ece.ubc.ca:~
cd ./ssh
rm config.cfg
rm config_reader.sh
rm recompile.sh