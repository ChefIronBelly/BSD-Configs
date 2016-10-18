#!/bin/sh
# ~/bin/status.sh
#

. $HOME/.wmrc

totalmem=$( freecolor -mo | awk 'NR==2 {print substr($2,0,4)}')
usedmem=$( freecolor -mo | awk 'NR==2 {print substr($3,0,3)}')
mem="mem: ${usedmem}MB/${totalmem}MB"
#mem="mem:$(freecolor -o | awk 'NR==2 {print substr($3,0,3)}')"
vol="vol: $(mixer -s vol| cut -d ':' -f 2)%"
ip="ip: $( if_ip.sh )"
#mail="mail: $(gmail.sh)"
time=$(date +" %a, %b %d %I:%M")
current=""
  
if mpc status | grep -q playing; then
  current="| ""$(mpc current --format "%artist% - %title% $(date -d@$(mpdtime) +%-M:%S)/%time%")"
  [[ ${#current} -gt 80 ]] && current="${current:0:10}...${current:(-70)}"
elif mpc status | grep -q paused; then
  current="| paused "
fi

echo -n $time "|" $mem "|" $ip "|" $vol $current | osd_cat -p top -A center -d 5 -s 0 -c '#ffffff' -f $FONT
