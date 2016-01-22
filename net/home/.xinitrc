#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset +dpms
xset b off

xset +fp /home/chef/.fonts/
xset fp rehash

xmodmap ~/.swapesc

xrdb -load ~/.Xresources &

export XCOL0=333333
export XCOL1=705050
export XCOL2=60b48a
export XCOL3=d64937
export XCOL4=506070
export XCOL5=dc8cc3
export XCOL6=8cd0d3
export XCOL7=dedede
export FONT="DejaVuSansMono:style=Book:size=10"
export ICOFONT="fontawesome-webfont:style=Regular:size=11"

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
#xsetroot -solid '#2d2d2d'
hsetroot -fill ~/Pictures/wallpapers/optimal-performance.jpg -tint '#506070'

wew | focus_watcher.sh &

exec xterm
