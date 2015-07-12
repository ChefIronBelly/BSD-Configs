#!/bin/sh

#vol="vol/pcm: $( ( mixer -s vol 2> /dev/null || echo - ) | cut -d ':' -f 2 )/$( ( mixer -s pcm 2> /dev/null || echo - ) | cut -d ':' -f 2 )"
ip="ip: $( if_ip.sh )"
time=$(date +" %a, %b %d %I:%M")

echo -n $ip - $time | osd_cat -p top -A center -d 15 -s 0 -c '#eeeeee' -f '-*-dejavu sans mono-*-*-*-*-14-*-*-*-*-*-*-*'

