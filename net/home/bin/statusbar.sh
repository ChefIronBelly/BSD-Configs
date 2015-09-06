#!/bin/sh

font="monofur for Powerline:size=10"
ico_font="fontawesome-webfont:size=11"

# alpha
a="#ff"

# default colors
bg="${a}${XCOL0}"
fg="${a}${XCOL7}"
hl="#FFFFFF"

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
   test -n "$cur" && echo $cur || echo " // StereoMatic //"   
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

echo %{l}%{B${a}${XCOL0}}%{F${a}${XCOL4}}%{A:xterm -e cmus:}" "%{A} %{F-} $(cur)%{c}%{F${a}${XCOL7}}" "%{F-}%{F${a}${XCOL5}}""%{F-}%{F${a}${XCOL7}}"  "%{F-}%{r} %{F${a}${XCOL7}}" "%{F-} $(ip)  %{F${a}${XCOL7}}   %{F-}$(vol) %{F${a}${XCOL7}}    %{F-}$(dateclock)%{F${a}${XCOL7}}    %{F-}$(clock)"  "
}

while true
 do
    echo "$(statusbar)"
   sleep 0.5
      
 done |  lemonbar -p -d -g $GEOM -f "DejaVu Sans Mono:size=10" -f $ico_font -B $bg -F $fg | while read line; do eval "$line"; done
