#!/bin/sh

playing="Now: $(cmus-info)"
mem="mem: $(top -n 1 | head -n 4 | tail -n 1 | awk '{print $2}')"
vol="vol: $( volume.sh)"
ip="ip: $( if_ip.sh )"
time=$(date +" %a, %b %d %I:%M")

echo -n $playing - $vol - $mem - $ip - $time | osd_cat -p top -A center -d 15 -s 0 -c '#eeeeee' -f '-*-tamsyn-medium-*-*-*-14-*-*-*-*-*-*-1'

