#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset +dpms
xset b off

xset +fp /home/chef/.fonts/
xset fp rehash

xmodmap ~/.swapesc

xrdb -load ~/.Xresources &

export XCOL0=181818
export XCOL1=282828
export XCOL2=383838
export XCOL3=585858
export XCOL4=b8b8b8
export XCOL5=d8d8d8
export XCOL6=e8e8e8
export XCOL7=f8f8f8
export FONT="DejaVuSansMono:style=Book:size=10"

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
xsetroot -solid '#181818'
#hsetroot -center ~/Pictures/wallpapers/ajAtLx0.jpg -tint '#65737e'

wew | focus_watcher.sh &
exec wmutils
