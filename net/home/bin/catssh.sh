#!/bin/sh
# catssh it (chef 2015)
# requires: ssh
# usage: catssh $FILE $NAME@SERVER /$PATH/
# example:  kill.la.kill.s01e20.mp4 root@192.168.0.52 /storage/tvshows/

cat $1 | ssh -v $2 cat ">" $3$1
echo "copy" $1 ">" $2 "complete"
