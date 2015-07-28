#!/bin/sh

setxkbmap -layout us -option terminate:ctrl_alt_bksp

# Enforce correct locales from the beginning:
unset LC_ALL
export LANG=en_US.UTF-8 
export LC_MESSAGES=C
export LC_TIME=en_US.UTF-8 

# xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
xcompmgr -FfCc &
devilspie -a &


# Disable DPMS turning off the screen
xset -dpms
xset s off

xset fp+ /home/chef/.fonts/
xset fp rehash
xset b off

if [ -s ~/.Xresources ]; then
	xrdb -merge ~/.Xresources
fi

xsetroot -cursor_name left_ptr
#xsetroot -solid '#333333'
hsetroot -fill ~/Pictures/wallpapers/potofgold.jpg & #-tint '#c7c7c7' & #-blur 1

# Start i3 and log to ~/.i3/logfile
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/pkg/bin/i3 -V -d all >> ~/.i3/logfile
