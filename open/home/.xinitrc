#!/bin/sh

setxkbmap -option terminate:ctrl_alt_bksp
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
#xcompmgr &
#devilspie -a &

#xset fp+ /usr/local/share/fonts/
xset fp+ /home/chef/.fonts/
xset fp rehash
xset b off

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

xsetroot -solid '#3f3f3f'
#setroot -fill ~/Pictures/wallpapers/underwater_tiles.jpg #-blur 1

exec cwm 
