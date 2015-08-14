#!/bin/sh

font="Monaco:size=10"
bg="#ff2d2d2d"
fg="#ffd3d0c8"
hl="#ffd3d0c8"

default_geometry() {
    # get screen size
    x=$(wattr w `lsw -r`)
    y=$(wattr h `lsw -r`)

    width=360
    height=24

    offy=10
    offx=$(( x - x/2 - $width/2 ))

    echo "${width}x${height}+${offx}+${offy}"
}

ip() {
    ip=$( if_ip.sh )
    echo $ip
}

clock() {
    time=$(date +" %a, %b %d %I:%M")
    echo $time
}

vol() {
    vol="$( volume.sh)"
    echo $vol
}

GEOM=${GEOM:-$(default_geometry)}
SLEEP=${SLEEP:-10}

(echo $(ip) - $(vol) - $(clock) ; sleep $SLEEP) | lemonbar -d -g $GEOM -f $font -B $bg -F $fg
