#	$NetBSD: dot.profile,v 1.8.4.1 2012/04/12 17:12:06 riz Exp $
#

LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LC_ALL=""
TZ=America/New_York
export LANG LC_CTYPE LC_ALL TZ

export EDITOR=vi
export EXINIT="se sm ai redraw sw=4"
export VISUAL=${EDITOR}

#export PAGER=more

# Set your default printer, if desired.
#export PRINTER=change-this-to-a-printer

# Set the search path for programs.
PATH=$HOME/.bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R7/bin
PATH=${PATH}:/usr/pkg/bin:/usr/pkg/sbin
export PATH

# Configure the shell to load .shrc at startup time.
# This will happen for every shell started, not just login shells.
export ENV=$HOME/.mkshrc

#export PKG_PATH=ftp://ftp.NetBSD.org/pub/pkgsrc/packages/$(uname -s)/$(uname -m)/$(uname -r|cut -f '1 2' -d.)/All/
export PKG_PATH=http://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/amd64/8.0/All/

export CVSROOT="anoncvs@anoncvs.NetBSD.org:/cvsroot"

# set CVS remote shell command
CVS_RSH=ssh
export CVS_RSH
