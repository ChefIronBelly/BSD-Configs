#!/bin/sh
# play somaFM radio streams using dmenu and mpg123.

. $HOME/.wmrc

selection="";

if [ "$(pgrep mpg123)" ] ; then
        echo -n "All your sound belong to us ..." | osd_cat -p top -A center -d 3 -s 0 -c '#$FG' -f $FONT
        pkill mpg123
        exit 0
fi

stations="$(cat /home/chef/.bin/stations)"
selection="$(echo "$stations" | dmenu "$@" $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB)"
player() { mpg123 -C -b 3000 -@ "$@" 2>/dev/null & }

if [ "$selection" ]; then
		echo -n "Playing SomaFM channel $selection ..." | osd_cat -p top -A center -d 3 -s 0 -c '#$FG' -f $FONT
		player http://somafm.com/$selection.pls
else exit;
fi
