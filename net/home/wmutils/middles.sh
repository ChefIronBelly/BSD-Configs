#!/bin/sh

CUR=${2:-$(pfw)}
ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

BW=$(wattr b $CUR)
W=$(wattr w $CUR)
H=$(wattr h $CUR)

offlm=20
offrm=90

X=0
Y=0

case $1 in
    y) X=$((SW/4 - W/2 - BW + ${offlm}))
       Y=$((SH/2 - H/2 - BW));;
    g) X=$((SW/2 - W/2 - BW))
       Y=$((SH/2 - H/2 - BW)) ;;
    u) X=$((SW/2 + W/4 - BW - ${offrm}))
       Y=$((SH/2 - H/2 - BW));;    
esac

wtp $X $Y $W $H $CUR
