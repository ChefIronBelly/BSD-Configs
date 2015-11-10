#!/bin/sh

font="DejaVuSansMono:size=10"

# alpha
a="#ff"
b="#c0"

# default colors
bg="${a}${XCOL0}"
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

group1() {
    group1=$(gind1.sh)
    echo $group1
}

group2() {
    group2=$(gind2.sh)
    echo $group2
}

group3() {
    group3=$(gind3.sh)
    echo $group3
}

group4() {
    group4=$(gind4.sh)
    echo $group4
}

echo %{l}%{B${a}${XCOL0}%{F${a}${XCOL5}} "0 x 0 0 0 0" $(group4) %{F-}%{F${a}${XCOL5}}$(group3)%{F-} %{F${a}${XCOL5}}$(group2)%{F-} %{F${a}${XCOL5}}$(group1)%{F-}%{r}%{F${a}${XCOL2}}" | "%{F-}$(ip)%{F${a}${XCOL2}}" | "%{F-}$(vol)%{F${a}${XCOL2}}" | "%{F-}$(dateclock)%{F${a}${XCOL2}}" | "%{F-}$(clock)%{F${a}${XCOL2}}" | "%{F-}%{B-}
}

while true
 do
    echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f $font -B $bg -F $fg
