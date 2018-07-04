#!/bin/ksh

# Do make a history
HISTFILE=~/.ksh/history
HISTSIZE=5000

LC_CTYPE="en_US.UTF-8"
OS=$(uname)

#### SAFETY ####

alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'

#alias ..='cd ../'
#alias ...='cd ../../'
#alias ....='cd ../../../'
alias ls='colorls -G'
alias la='colorls -A'
alias ll='colorls -L'
alias md='mkdir -p -v'
alias rd='rmdir -v'
alias h='fc -l'
alias p='pwd'
alias manb='man -H'
alias grep='grep --color=auto'

alias ins='sudo pkgin install'
alias pupd='sudo pkgin update'
alias pupg='sudo pkgin upgrade'
alias pfug='sudo pkgin full-upgrade'
alias search='sudo pkgin search'
alias autoremove='sudo pkgin autoremove'

# REBOOT/SHUTDOWN
alias reboot='sudo /sbin/shutdown -r now "R E B O O T"'
alias poweroff='sudo /sbin/shutdown -p now "P O W E R O F F"'
alias shutdown='sudo /sbin/shutdown -p now "Going D O W N to the crossroads"'

# Space on drive
alias disk='du -h | sort -n -r |more'

alias preview='feh -g 450x300+500+200 -R .01 --zoom fill'
#alias rec='ffmpeg -f x11grab -s 1280x800 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'
alias rec='ffmpeg -f x11grab -s 1920x1080 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'

alias info='info.sh'
alias todo='vim ~/todo'
alias rnet='sudo /etc/rc.d/network restart'

alias zzz='slock'
alias shootme='DISPLAY=:0 import -window root ~/Pictures/scrots/scrot-$(date +%m-%d-%Y-%H-%M-%S).png'
#alias free='top -n 1 | head -n 5 | tail -n 2'
alias blankf='cdrecord dev=/dev/rcd0d blank=fast'
alias blanka='cdrecord dev=/dev/rcd0d blank=all'
alias rip='doas cdparanoia -g /dev/rcd0d -B'
alias weather='curl -4 http://wttr.in'
alias tb='nc termbin.com 9999'
alias ytdl='youtube-dl'
alias v='vim'
alias ping='ping -c3'
alias mc='mc -a'
alias g='git'
alias gc='git commit -m "adds and tweaks"'
alias mc='mc -a'
alias umount='sudo umount /mnt/$1'
alias dm='dmenu_start.sh'

PS1=""
 case `id -u` in
 	0) PS1="${PS1}# ";;
 	*) PS1="${PS1}$ ";;
 esac
