#!/bin/sh

. $HOME/.wmrc

#playing="Now: $(cmus-info)"
mem="mem: $(top -n 1 | head -n 5 | tail -n 1 | awk '{print $3}')"
vol="vol:$(volumebar.sh)"
ip="ip: $( if_ip.sh )"
#mail="mail: $(gmail.sh)"
time=$(date +" %a, %b %d %I:%M")
cur=$(mpc_pop.sh)

echo -n $time "|" $mem "|" $ip "|" $vol $cur | osd_cat -p top -A center -d 5 -s 0 -c '#f8f8f2' -f $FONT
