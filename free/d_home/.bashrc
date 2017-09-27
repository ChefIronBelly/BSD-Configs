#!/bin/sh
# ~/.bashrc
#

PS1=""
 case `id -u` in
 	0) PS1="${PS1}# ";;
 	*) PS1="${PS1}$ ";;
 esac

# Do make a history
HISTFILE=~/.mksh/history
HISTSIZE=5000

for h in ~/.etc/*; do
	source "${h}"
done
