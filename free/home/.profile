# $FreeBSD: releng/10.3/share/skel/dot.profile 266029 2014-05-14 15:23:06Z bdrewery $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin:$HOME/wmutils; export PATH
# BLOCKSIZE=K;	export BLOCKSIZE

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# TERM=xterm; 	export TERM

EDITOR=vi;   	export EDITOR
PAGER=more;  	export PAGER

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

#if [ -x /usr/games/fortune ] ; then /usr/games/fortune freebsd-tips ; fi

PS1=""
 case `id -u` in
 	0) PS1="${PS1}# ";;
 	*) PS1="${PS1}$ ";;
 esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -n "$XTERM_VERSION" ] && transset --id "$WINDOWID" >/dev/null
