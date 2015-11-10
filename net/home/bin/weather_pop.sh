#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Create a small popup with the given text
#
# depends: lemonbar, wattr and common sense

# bar options
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

    width=460
    height=20

    offy=21
    offx=$(( x - x/2 - $width/2 ))

    echo "${width}x${height}+${offx}+${offy}"
}

test "$#" -lt 1 && exit 1

while getopts "d:g:h" opt; do
    case $opt in
        d) SLEEP=$OPTARG ;;
        g) GEOM=$OPTARG  ;;
        h) usage; exit 0 ;;
        *) usage; exit 1 ;;
    esac
done

GEOM=${GEOM:-$(default_geometry)}
SLEEP=${SLEEP:-5}

(echo "%{c}$@"; sleep $SLEEP) | lemonbar -d -g $GEOM -f $font -B $bg -F $fg

