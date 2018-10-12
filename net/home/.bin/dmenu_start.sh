#!/bin/sh

. $HOME/.wmrc

#dmenu_run -i -p "Search" -x 290  -y 0  -w 300 $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB
dmenu_run -i $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB
