#!/bin/sh

font="Hack:size=10"
ico_font="fontawesome-webfont:size=11"

# alpha
a="#ff"

# default colors
bg="${a}${XCOL1}"
fg="${a}${XCOL7}"
hl="${a}${XCOL5}"

default_geometry() {
    # get screen size
    x=$(wattr w `lsw -r`)
    y=$(wattr h `lsw -r`)

    width=1440
    height=20

    offy=0
    offx=$(( x - x/2 - $width/2 ))

    echo "${width}x${height}+${offx}+${offy}"
}

GEOM=${GEOM:-$(default_geometry)}

statusbar() {

cur() {
   cur=$(cmus-info)
   test -n "$cur" && echo $cur || echo " Select-o-matic"   
   }

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

echo %{l}%{B${a}${XCOL0}}%{F${a}${XCOL3}}%{A:xterm -e cmus:}" "%{A}%{F-} $(cur)%{c}%{F${a}${XCOL5}}$(group1)%{F-} %{F${a}${XCOL5}}$(group2)%{F-} %{F${a}${XCOL5}}$(group3)%{F-} %{F${a}${XCOL5}}$(group4)%{F-} %{r}%{F${a}${XCOL3}}" "%{F-} $(ip)  %{F${a}${XCOL3}}   %{F-}$(vol) %{F${a}${XCOL3}}    %{F-}$(dateclock)%{F${a}${XCOL3}}   %{F-}$(clock)%{F${a}${XCOL3}}   %{F-}
}

while true
 do
    echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f $font -f $ico_font -B $bg -F $fg | while read line; do eval "$line"; done
