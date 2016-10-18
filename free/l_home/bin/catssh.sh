#!/bin/sh
# catssh (chef 2015)
# requires: ssh
# usage: catssh.sh $FILE $NAME@SERVER /$PATH/ 
# example: catssh.sh kill.la.kill.s01e20.mp4 ssh root@192.168.0.52 /storage/tvshows/

SSH_HOST=root@192.168.0.109
SSH_PATH=/storage/tvshows/

#$2="root@192.168.0.52"
#$3="/storage/tvshows/"

cat $1 | ssh $SSH_HOST cat ">" $SSH_PATH$1 2>/dev/null
echo "copy" $1 ">" $2 "complete"
