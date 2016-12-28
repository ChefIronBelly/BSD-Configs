#!/bin/sh
# ~/bin/status.sh
#

. $HOME/.wmrc

#mem="mem: $(top -n 1 | head -n 7 | tail -n 1 | awk '{print $3}')"
memtotal="$(($(sysctl -n hw.physmem) / 1024 / 1024))"
memused="$(($(vmstat | awk 'END {printf $4}') / 1024))"
mem="mem:${memused}MB/${memtotal}MB"
vol="vol:$(volumebar.sh)"
ip="ip:$( if_ip.sh )"
#mail="mail: $(gmail.sh)"
time=$(date +" %a, %b %d %I:%M")

echo -n $time "|" $mem "|" $ip "|" $vol | osd_cat -p top -A center -d 10 -s 0 -c '#f7f7f7' -f $FONT
