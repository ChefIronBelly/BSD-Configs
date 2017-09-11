#!/bin/sh

. $HOME/.wmrc

entry=`echo "... and search the web" | dmenu $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB -p "type a word..."`
if test "X$entry" != "X"; then
        firefox http://www.google.com/search?q="$entry"
fi
