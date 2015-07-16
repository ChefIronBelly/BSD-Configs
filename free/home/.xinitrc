#!/bin/sh

LANG=en_US.UTF-8; export LANG

setxkbmap -option terminate:ctrl_alt_bksp
xcompmgr &
devilspie -a &

xset fp+ /home/chef/.fonts/
xset fp rehash
xset b off

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr
xetroot -solid '#333333'
#hsetroot -fill ~/Pictures/wallpapers/blue_minimalistic.jpg

exec cwm 

