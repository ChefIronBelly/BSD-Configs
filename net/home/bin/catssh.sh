#!/bin/sh
# catssh (chef 2015)
# requires: ssh
# usage: catssh.sh $FILE $NAME@SERVER /$PATH/ 
# example: catssh.sh kill.la.kill.s01e20.mp4 ssh root@192.168.0.52 /storage/tvshows/

cat $1 | ssh $2 cat ">" $3$1 2>/dev/null
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'

echo "copy" $1 ">" $2 "complete"
