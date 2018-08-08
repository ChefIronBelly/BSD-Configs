#!/bin/sh
# 
# chef 2015
# puts focused window to left middle, center or right middle.
# use offlm and offrm to offset placement for screen sizes.

CUR=${2:-$(pfw)}
ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

BW=$(wattr b $CUR)
W=$(wattr w $CUR)
H=$(wattr h $CUR)

PANEL=${PANEL:-20}

# calculate usable screen size (without borders and gaps)
SW=$((SW - BW))
SH=$((SH - BW - PANEL))

offlm=60
offrm=100

X=0
Y=0

# it's pretty simple, but anyway...
usage() {
    echo "usage: $(basename $0) <left|middle|right>"
    exit 1
}

# exit if no argument given
test -z "$1" && usage

case $1 in
    left) X=$((SW/4 - W/2 - BW + ${offlm}))
		Y=$((SH/2 + PANEL/2 - H/2 - BW));;
  center) X=$((SW/2 - W/2 - BW))
		Y=$((SH/2 + PANEL - H/2 - BW)) ;;
    right) X=$((SW/2 + W/4 - BW - ${offrm}))
		Y=$((SH/2 + PANEL/2 - H/2 - BW));;    
esac

wtp $X $Y $W $H $CUR

