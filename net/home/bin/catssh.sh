#!/bin/sh
# catssh (chef 2015)
# requires: ssh
# usage: catssh $FILE $NAME@SERVER /$PATH/ 
# example:  kill.la.kill.s01e20.mp4 | ssh root@192.168.0.52 cat ">" /storage/tvshows/

cat $1 | ssh $2 cat ">" $3$1 2>/dev/null
echo "copy" $1 ">" $2 "complete"
