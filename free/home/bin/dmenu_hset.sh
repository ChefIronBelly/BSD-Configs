#!/bin/sh
# set wallpaper using dmenu

. $HOME/.dmenurc

selection="";

wallpath=/home/chef/Pictures/wallpapers
walls="$(ls $wallpath)"
selection="$(echo "$walls" | dmenu "$@" $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB)"

if [ "$selection" ]; then
	hsetroot -cover $wallpath/$selection -tint '#506070'
else exit;
fi
