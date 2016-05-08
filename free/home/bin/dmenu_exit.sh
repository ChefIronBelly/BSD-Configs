#!/bin/sh
# a simple logout dialog

. $HOME/.wmrc

choice=`echo -e "0: Logout\n1: Shutdown\n2: Reboot\n3:Lock\n4:Cancel" | dmenu $DMENU_FN $DMENU_NB $DMENU_NF $DMENU_SF $DMENU_SB -p "select an action:" | cut -d ':' -f 1`

# execute the choice in background
case "$choice" in
  0) xdotool key Ctrl+Alt+BackSpace & ;;
  1) shutdown & ;;
  2) reboot & ;;
  3) slock ;;
  4) exit ;;
esac
