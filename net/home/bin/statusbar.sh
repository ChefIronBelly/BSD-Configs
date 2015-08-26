#!/bin/sh

font="monaco:size=10"
ico_font="fontawesome-webfont:size=12"
bg="#ff${XCOL0}"
fg="#ff${XCOL5}"
hl="#ff${XCOL5}"

default_geometry() {
    # get screen size
    x=$(wattr w `lsw -r`)
    y=$(wattr h `lsw -r`)

    width=400
    height=20

    offy=0
    offx=$(( x - x/2 - $width/2 ))

    echo "${width}x${height}+${offx}+${offy}"
}

cur() {
   cur=$(cmus-info)
   test -n "$cur" && echo $cur || echo "you ain't got nuthin' playin' "   
   }

ip() {
    ip=$(if_ip.sh)
    echo $ip
}

clock() {
    time=$(date +" %a, %b %d %I:%M")
    echo $time
}

vol() {
    vol=$(volume.sh)
    echo $vol
}

GEOM=${GEOM:-$(default_geometry)}
SLEEP=${SLEEP:-10}

(echo " " $(ip)    $(vol)    $(clock); sleep $SLEEP) | lemonbar -d -g $GEOM -f $font -f $ico_font -B $bg -F $fg
