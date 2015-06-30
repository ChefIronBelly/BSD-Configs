#!/bin/sh

LANG=en_US.UTF-8; export LANG

setxkbmap -option terminate:ctrl_alt_bksp
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
xcompmgr &
devilspie -a &

#xset fp+ /usr/local/share/fonts/
xset fp+ /home/chef/.fonts/
xset fp rehash
xset b off

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr
#xetroot -solid '#3f3f3f'
hsetroot -fill ~/Pictures/wallpapers/simpledesktops.jpg

exec cwm 

