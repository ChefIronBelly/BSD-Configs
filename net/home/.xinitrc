#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset +dpms
xset b off

xset +fp /home/chef/.fonts/
xset fp rehash

xmodmap ~/.swapesc

xrdb -load ~/.Xresources &

export XCOL0=2C3E50
export XCOL1=34495E
export XCOL2=7F8C8D
export XCOL3=95A5A6
export XCOL4=BDC3C7
export XCOL5=e0e0e0
export XCOL6=f5f5f5
export XCOL7=ECF0F1
export FONT="DejaVuSansMono:style=Book:size=10"

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
xsetroot -solid '#2C3E50'
#hsetroot -center ~/Pictures/wallpapers/ajAtLx0.jpg -tint '#65737e'

wew | focus_watcher.sh &
exec wmutils
