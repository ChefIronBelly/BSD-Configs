#!/bin/sh

CUR=${2:-$(pfw)}
ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)

BW=$(wattr b $CUR)
W=$(wattr w $CUR)
H=$(wattr h $CUR)

X=0
Y=0

case $1 in
    y) X=$((SW/4 - W/2 - BW + 40))
       Y=$((SH/2 - H/2 - BW));;
    g) X=$((SW/2 - W/2 - BW))
       Y=$((SH/2 - H/2 - BW)) ;;
    u) X=$((SW/2 + W/4 - BW - 80))
       Y=$((SH/2 - H/2 - BW));;    
esac

wtp $X $Y $W $H $CUR
