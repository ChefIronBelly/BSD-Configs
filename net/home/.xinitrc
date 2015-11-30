#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset +dpms
xset b off

xset +fp /home/chef/.fonts/
xset fp rehash

xmodmap ~/.swapesc

xrdb -load ~/.Xresources &

export XCOL0=3f3f3f
export XCOL1=705050
export XCOL2=60b48a
export XCOL3=dfaf8f
export XCOL4=506070
export XCOL5=dc8cc3
export XCOL6=8cd0d3
export XCOL7=dcdccc
export FONT="DejaVuSansMono:style=Book:size=10"

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
xsetroot -solid '#3f3f3f'
#hsetroot -center ~/Pictures/wallpapers/ajAtLx0.jpg -tint '#65737e'

wew | focus_watcher.sh &
exec wmutils
