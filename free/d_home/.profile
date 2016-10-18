# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PATH
export LANG=en_US.UTF-8

extract()
{
	case "$1" in
		*.tar.bz2) tar xvjf   "$1" ;;
		*.tar.gz)  tar xvzf   "$1" ;;
		*.bz2)     bunzip2    "$1" ;;
		*.rar)     unrar x    "$1" ;;
		*.gz)      gunzip     "$1" ;;
		*.tar)     tar xvf    "$1" ;;
		*.tbz2)    tar xvjf   "$1" ;;
		*.tgz)     tar xvzf   "$1" ;;
		*.zip)     unzip      "$1" ;;
		*.Z)       uncompress "$1" ;;
		*.7z)      7z x       "$1" ;;
		*.xz)      xz -d      "$1" ;;
		*.deb)     ar vx      "$1" ;;
		*)         printf 'extract: Unknown archive type\n';;
	esac
}

color()
{
	for color in 0 1 2 3 4 5 6 7
	do printf " \033[3${color}m██\033[1m██\033[0m"
	done
	printf '\n'
}

CC=cc
