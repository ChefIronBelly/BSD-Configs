#!/bin/sh

# alpha
a="#ff"
b="#c0"

# default colors
bg="${a}${XCOL1}"
fg="${a}${XCOL5}"
hl="${a}${XCOL3}"

default_geometry() {
    # get screen size
    x=$(wattr w `lsw -r`)
    y=$(wattr h `lsw -r`)

    width=x # x=full width or values like 1280, 1440, 1920, etc
    height=20

    offy=0
    offx=$(( x - x/2 - $width/2 ))

    echo "${width}x${height}+${offx}+${offy}"
}

GEOM=${GEOM:-$(default_geometry)}

statusbar() {

ip() {
    ip=$(if_ip.sh)
    echo $ip
}

clock() {
    time=$(date +" %I:%M")
    echo $time
}

dateclock() {
    datetime=$(date +" %a, %b %d")
    echo $datetime
}

vol() {
    vol=$(volumebar.sh)
    echo $vol
}

groups() {
    groups=$(gind.sh)
    echo $groups
}

echo %{l}%{F${a}${XCOL3}}" |"%{F-}" 0 x "$(groups)%{F${a}${XCOL3}}" |"%{F-}%{r}%{F${a}${XCOL3}}" | "%{F-}$(ip)%{F${a}${XCOL3}}" | "%{F-}$(vol)%{F${a}${XCOL3}}" | "%{F-}$(dateclock)%{F${a}${XCOL3}}" | "%{F-}$(clock)%{F${a}${XCOL3}}" | %{F-}"
}

while true
 do
    echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f $FONT -B $bg -F $fg
