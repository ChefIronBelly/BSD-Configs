#!/bin/sh
# play somaFM radio streams using dmenu and mpg123.

. $HOME/.wmrc

selection="";

if [ "$(pgrep mpg123)" ] ; then
        echo -n "All your sound belong to us ..." | osd_cat -p top -A center -d 3 -s 0 -c '#eeeeee' -f '-*-terminus-*-*-*-*-14-*-*-*-*-*-*-1'
        pkill mpg123
        exit 0
fi

stations="$(cat /home/chef/bin/stations)"
selection="$(echo "$stations" | dmenu "$@" $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB)"
player() { mpg123 -C -@ "$@" 2>/dev/null & }

if [ "$selection" ]; then
		pop.sh "Playing SomaFM channel $selection ..."
		player http://somafm.com/$selection.pls
else exit;
fi
