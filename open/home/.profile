# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LC_ALL=""
TZ=America/New_York
export LANG LC_CTYPE LC_ALL TZ

PATH=$HOME/.bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
export PATH

export PKG_PATH=http://mirrors.sonic.net/pub/OpenBSD/snapshots/packages/amd64/

# Configure the shell to load .shrc at startup time.
# This will happen for every shell started, not just login shells.
export ENV=$HOME/.mkshrc
