#!/bin/sh

# alpha
a="#ff"
b="#c0"

# default colors
bg="${a}${XCOL1}"
fg="${a}${XCOL5}"
hl="${a}${XCOL5}"

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

echo %{l}%{B${a}${XCOL1}}%{F${a}${XCOL4}}"[0 x "$(groups)"]"${F-}%{r}%{F${a}${XCOL4}}"["$(ip)"] ["$(vol)"] ["$(dateclock)"] ["$(clock)"] "%{F-}%{B-}
}

while true
 do
    echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f $FONT -B $bg -F $fg
