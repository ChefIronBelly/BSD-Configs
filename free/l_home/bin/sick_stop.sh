#!/bin/sh

echo "Stopping nzbget"
sudo nzbget -Q 

echo "Stopping transmission"
sudo killall transmission-daemon
