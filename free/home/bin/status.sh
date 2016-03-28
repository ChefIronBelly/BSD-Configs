#!/bin/sh

#bat="bat: $(sysctl -n hw.acpi.battery.life)%" > /dev/null 2>&1
#load="avg. load: $(sysctl -n vm.loadavg | tr -d -c ' [0-9].' | sed -e 's/\(.*\)./\1/' -e 's/^.\{1\}//g' | tr ' ' '/' | tr -d '\n')"
#mhz="mhz: $(sysctl -n dev.cpu.0.freq | tr -d '\n')"
#mem="mem: $(freecolor -o | awk 'NR==2 {print substr($3,0,3)}')"
vol="vol/pcm: $( ( mixer -s vol 2> /dev/null || echo - ) | cut -d ':' -f 2 )/$( ( mixer -s pcm 2> /dev/null || echo - ) | cut -d ':' -f 2 )"
ip="ip: $( if_ip.sh )"
time=$(date +" %a, %b %d %I:%M")

echo -n $vol - $ip - $time | osd_cat -p top -A center -d 30 -s 0 -c '#eeeeee' -f "DejaVuSansMono 12"
