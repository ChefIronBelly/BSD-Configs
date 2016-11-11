#!/bin/sh
# ~/bin/status.sh
#

. $HOME/.wmrc

#mem="mem: $(top -n 1 | head -n 7 | tail -n 1 | awk '{print $3}')"
memtotal="$(($(sysctl -n hw.physmem) / 1024 / 1024))"
memused="$(($(vmstat | awk 'END {printf $4}') / 1024))"
mem="mem:${memused}MB / ${memtotal}MB"
vol="vol:$(volumebar.sh)"
ip="ip:$( if_ip.sh )"
#mail="mail: $(gmail.sh)"
time=$(date +" %a, %b %d %I:%M")
current=""
  
if mpc status | grep -q playing; then
  current="| ""$(mpc current --format "%artist% - %title% $(date -d@$(mpdtime) +%-M:%S)/%time%")"
  [[ ${#current} -gt 80 ]] && current="${current:0:10}...${current:(-70)}"
elif mpc status | grep -q paused; then
  current="| paused "
fi

echo -n $time "|" $mem "|" $ip "|" $vol | osd_cat -p top -A center -d 10 -s 0 -c '#ffffff' -f $FONT
