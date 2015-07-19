#!/bin/sh
#
# (c) 2007, by Robert Manea

# icons
ICONPATH=$HOME/.dzen/bitmaps
# network interface
#INTERFACE=wlan0
ip="$( if_ip.sh )"

# update every x seconds
SLEEP=3

#colors
FONT='-*-gohufont-*-*-*-*-14-*-*-*-*-*-*-*'
FONTCOLOR='#eeeeee'
BACKGROUND='#222222'

#geometry
WIDTH=660
X=630
Y=0

while :; do

Ip()
	echo -n "^fg(#555555)^i($ICONPATH/wifi_02.xbm)^fg() ${ip}"
	return

Battery()
{ 
	b_usage="$(sysctl -n hw.acpi.battery.life)%"
   echo -n "^fg()^i($ICONPATH/bat_full_01.xbm)^fg() ${b_usage}"
   return
}

Memory() 
{
  mem_used="$(freecolor -o | awk 'NR==2 {print substr($3,0,3)}')"
  echo -n "^fg()^i($ICONPATH/mem.xbm)^fg() ${mem_used}M"
  return
}

Volume ()
{
	volume="vol: $( (mixerctl outputs.master 2> /dev/null || echo - ) | cut -d ':' -f 3)"
		echo -n "^fg(#555555)^i($ICONPATH/spkr_01.xbm)^fg() ^fg(#FFFFFF)${volume}" 
	return
}

Date ()
{
	TIME=$(date +" %a, %b %d %I:%M")
		echo -n "^fg(#555555)^i($ICONPATH/clock.xbm)^fg(#FFFFFF) ${TIME}"
	return
}

Between ()
{
    echo -n " ^fg(#222222)^r(5x2)^fg() "
	return
}

# --------- End Of Functions


# Print 

Print () 
{	
#	Memory
#    Between
	Volume
	Between
	Ip
	Between
	Date
        echo
    return
}

echo "$(Print)"

  sleep $SLEEP
done | dzen2 -x $X -y $Y  -tw $WIDTH -fg $FONTCOLOR -bg $BACKGROUND -fn '-*-gohufont-*-*-*-*-14-*-*-*-*-*-*-*'
