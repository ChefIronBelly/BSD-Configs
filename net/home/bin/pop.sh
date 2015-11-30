#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Create a small popup with the given text
#
# depends: lemonbar, wattr and common sense

# alpha
a="#ff"
b="#c0"

# default colors
bg="${a}${XCOL4}"
fg="${a}${XCOL7}"
hl="${a}${XCOL0}"

default_geometry() {
    # get screen size
    x=$(wattr w `lsw -r`)
    y=$(wattr h `lsw -r`)

    width=500
    height=18

    offy=0
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

(echo "%{c}$@"; sleep $SLEEP) | lemonbar -d -g $GEOM -f $FONT -B $bg -F $fg

