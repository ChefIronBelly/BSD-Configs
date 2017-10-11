#!/bin/sh
# set xsetroot color using dmenu

. $HOME/.wmrc

selection=`echo "Color" | dmenu -b $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB -p "enter a value..."`
xsetroot -solid "#$selection"
