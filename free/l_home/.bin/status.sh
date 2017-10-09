#!/bin/sh

. $HOME/.osdrc

#bat="bat: $(sysctl -n hw.acpi.battery.life)%" > /dev/null 2>&1
#load="avg. load: $(sysctl -n vm.loadavg | tr -d -c ' [0-9].' | sed -e 's/\(.*\)./\1/' -e 's/^.\{1\}//g' | tr ' ' '/' | tr -d '\n')"
#mhz="mhz: $(sysctl -n dev.cpu.0.freq | tr -d '\n')"
#mem="mem: $(freecolor -o | awk 'NR==2 {print substr($3,0,3)}')"
vol="vol/pcm: $( ( mixer -s vol 2> /dev/null || echo - ) | cut -d ':' -f 2 )/$( ( mixer -s pcm 2> /dev/null || echo - ) | cut -d ':' -f 2 )"
ip="ip: $( if_ip.sh )"
time=$(date +" %a, %b %d %I:%M")

echo -n "|" $time "|" $vol "|" $ip "|"  | osd_cat $OSD_s $OSD_S $OSD_p $OSD_a $OSD_d $OSD_l $OSD_CL $OSD_FN $OSD_O
