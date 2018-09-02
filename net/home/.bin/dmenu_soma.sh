#!/bin/sh
# play somaFM radio streams using dmenu and mpg123.

. $HOME/.wmrc

selection="";

if [ "$(pgrep mpg123)" ] ; then
        #pop.sh "All your sound belong to us ..." # re:lemonbar, wmcore.
        echo "All your sound belong to us ..." | dmenu $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB
        pkill mpg123
        exit 0
fi

stations="$(cat /home/chef/.bin/stations)"
selection="$(echo "$stations" | dmenu "$@" $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB)"
player() { mpg123 -C -@ "$@" 2>/dev/null & }

if [ "$selection" ]; then
		#pop.sh "Playing SomaFM channel $selection ..."
		echo "Playing SomaFM channel $selection ..." | dmenu $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB
		player http://somafm.com/$selection.pls
else exit;
fi
