#!/bin/sh

# alpha
a="#ff"
b="#c0"

# default colors
bg="${a}${XCOL1}"
fg="${a}${XCOL5}"
hl="${a}${XCOL7}"

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

group5() {
    group5=$(gind5.sh)
    echo $group5
}

group6() {
    group6=$(gind6.sh)
    echo $group6
}

group7() {
    group7=$(gind7.sh)
    echo $group7
}

group8() {
    group8=$(gind8.sh)
    echo $group8
}

echo %{l}%{B${a}${XCOL1}}%{F${a}${XCOL5}}"["$(group8) $(group7) $(group6) $(group5) $(group4) $(group3) $(group2) $(group1)"]"${F-}%{r}%{F${a}${XCOL5}}" ["$(ip)"] ["$(vol)"] ["$(dateclock)"] ["$(clock)"] "%{F-}%{B-}
}

while true
 do
    echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f $FONT -B $bg -F $fg
