#!/bin/sh
# ~/bin/status.sh
#

. $HOME/.wmrc

mem="mem: $(top -n 1 | head -n 5 | tail -n 1 | awk '{print $3}')"
vol="vol:$(volumebar.sh)"
ip="ip: $( if_ip.sh )"
#mail="mail: $(gmail.sh)"
time=$(date +" %a, %b %d %I:%M")
current=""
  
if mpc status | grep -q playing; then
  current="| ""$(mpc current --format "%artist% - %title% $(date -d@$(mpdtime) +%-M:%S)/%time%")"
  [[ ${#current} -gt 80 ]] && current="${current:0:10}...${current:(-70)}"
elif mpc status | grep -q paused; then
  current="| [paused] "
fi

echo -n $time "|" $mem "|" $ip "|" $vol $current | osd_cat -p top -A center -d 5 -s 0 -c '#98d1ce' -f $FONT
