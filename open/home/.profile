# $OpenBSD: dot.profile,v 1.0 2016/10/20 06:56:57 chef Exp $

LC_CTYPE=en_US.UTF-8
TZ=America/New_York

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
LANG=en_US.UTF-8

XDG_DATA_HOME=$HOME
EDITOR=vim
VISUAL=$EDITOR
PAGER=less\ -R
BROWSER=open
MANWIDTH=80
CC=cc
CVSROOT=anoncvs@mirror.planetunix.net:/cvs

export LC_CTYPE PATH XDG_DATA_HOME EDITOR VISUAL PAGER BROWSER \
	MANWIDTH CC CVSROOT TZ
