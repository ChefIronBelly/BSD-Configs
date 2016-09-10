#!/bin/sh

#playing="Now: $(cmus-info)"
#mem="mem: $(top -n 1 | head -n 5 | tail -n 1 | awk '{print $3}')"
vol="vol:$(volumebar.sh)"
#ip="ip: $( if_ip.sh )"
time=$(date +" %a, %b %d %I:%M")

echo -n $time "|" $vol | osd_cat -p top -A center -d 5 -s 0 -c '#506070' -f '-*-ohsnap.icons-medium-r-*-*-14-*-*-*-*-*-*-*'

