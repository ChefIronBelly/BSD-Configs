#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset +dpms
xset b off

xset +fp /home/chef/.fonts/
xset fp rehash

xmodmap ~/.swapesc

xrdb -load ~/.Xresources &

export XCOL0=151515
export XCOL1=202020
export XCOL2=303030
export XCOL3=505050
export XCOL4=b0b0b0
export XCOL5=d0d0d0
export XCOL6=e0e0e0
export XCOL7=f5f5f5
export FONT="DejaVuSansMono:size=10"

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
xsetroot -solid '#151515'
#hsetroot -center ~/Pictures/wallpapers/crow-bird-raven.jpg

wew | focus_watcher.sh &
exec wmutils
