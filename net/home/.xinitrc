#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

xset +dpms
xset b off

xset +fp /home/chef/.fonts/
xset fp rehash

xmodmap ~/.swapesc

xrdb -load ~/.Xresources &

export XCOL0=101010
export XCOL1=252525
export XCOL2=464646
export XCOL3=525252
export XCOL4=ababab
export XCOL5=b9b9b9
export XCOL6=e3e3e3
export XCOL7=f7f7f7
export FONT="DejaVuSansMono:size=10"

sxhkd &
statusbar.sh &

xsetroot -cursor_name left_ptr
xsetroot -solid '#101010'
#hsetroot -center ~/Pictures/wallpapers/crow-bird-raven.jpg

wew | focus_watcher.sh &
exec wmutils
