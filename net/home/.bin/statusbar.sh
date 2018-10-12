#!/bin/sh

. $HOME/.wmrc

# alpha
a="#cc"
b="#00"

# default colors
bg="${a}${C0}"
fg="${a}${C4}"
sp="${a}${C7}"
red="${a}${C1}"
grn="${a}${C2}"

# default geometry
default_geometry() {
width=x # values like 1280, 1440, 1920, etc
height=20
offy=0
offx=0

echo "${width}x${height}+${offx}+${offy}"
}

GEOM=${GEOM:-$(default_geometry)}

statusbar() {
	

groups() {
    groups=$(gind.sh)
    echo $groups
}

mem() {
	memtotal="$(($(sysctl -n hw.physmem64) / 1024 / 1024))"
	memused="$(($(vmstat | awk 'END {printf $3}') / 1024))"
	mem="${memused}MB"
	echo $mem
}

ip() {
    ip=$(if_ip.sh)
    echo $ip
}

vol() {
	vol=$(vol_bar.sh)
	echo $vol
}

dateclock() {
    datetime=$(date +" %a, %b %d")
    echo $datetime
}

clock() {
    time=$(date +" %I:%M")
    echo $time
}

echo %{l}%{F${sp}}" >> "%{F-}%{F${fg}}"0x"$(groups)%{F-}%{c}%{F${sp}}%{F-}%{r}%{F${fg}}mem: $(mem)%{F-}%{F${sp}}" >> "%{F-}%{F${fg}}ip: $(ip)%{F-}%{F${sp}}" >> "%{F-}%{F${fg}}vol: $(vol)%{F-}%{F${sp}}" >> "%{F-}%{F${fg}} $(dateclock)%{F-}%{F${sp}}" @ "%{F-}%{F${fg}}$(clock)%{F-}%{F${sp}}" "%{F-}
}

while true
 do
   echo "$(statusbar)"
   sleep 1.0
      
 done |  lemonbar -p -d -g $GEOM -f $FONT -f $ICOFONT -B $bg
