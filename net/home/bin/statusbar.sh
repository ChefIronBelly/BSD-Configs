#!/bin/sh

. $HOME/.colorrc

# alpha
a="#cc"
b="#00"

# default colors
bg="${a}${C0}"
fg="${a}${C7}"
sp="${a}${C3}"

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
	
x11ind() {
	x11ind=$(x11fsind)
	echo $x11ind
}

groups() {
    groups=$(gind.sh)
    echo $groups
}

mem() {
	mem="$(free | grep Memory | awk -F ' ' '{ print $2 }')"
	echo $mem
}

ip() {
    ip=$(if_ip.sh)
    echo $ip
}

vol() {
    vol=$(volumebar.sh)
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

echo %{l}%{F${sp}}" | "%{F-}%{F${fg}}"0 x "$(groups)%{F-}%{F${sp}}" | "%{F-}%{F${fg}}$(x11ind)%{F-}%{r}%{F${sp}}" | "%{F-}%{F${fg}} $(mem)%{F-}%{F${sp}}" | "%{F-}%{F${fg}} $(ip)%{F-}%{F${sp}}" | "%{F-}%{F${fg}} $(vol)%{F-}%{F${sp}}" | "%{F-}%{F${fg}} $(dateclock)%{F-}%{F${sp}}" | "%{F-}%{F${fg}} $(clock)%{F-}%{F${sp}}" | %{F-}"
}

while true
 do
   echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f $FONT -f $ICOFONT -B $bg
