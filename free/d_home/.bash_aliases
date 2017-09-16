# .bash_aliases

alias upd='sudo freebsd-update fetch'
alias upg='sudo freebsd-update install'
alias ins='sudo pkg install'
alias pkgupd='sudo pkg update'
alias pkgupg='sudo pkg upgrade'
alias search='sudo pkg search'

## Space on drive
alias disk='du -h | sort -n -r |more'

#### SAFETY ####
alias rm='rm -Iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'

#### REBOOT/SHUTDOWN ####
alias reboot='sudo /sbin/shutdown -r now "R E B O O T"'
alias poweroff='sudo /sbin/shutdown -h now "P O W E R D O W N'
alias shutdown='sudo /sbin/shutdown -p now "Going D O W N to the crossroads"'

alias ls='ls -G'
#alias la='ls -A'
alias ll='ls -lG'

alias grep='grep --color=auto'

alias md='mkdir -p -v'
alias rd='rmdir -v'

alias manb='man -H'

#### My Adds
alias info='info.sh'
alias rec='ffmpeg -f x11grab -s 1920x1080 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'
alias todo='vi ~/todo'
alias rnet='sudo /etc/rc.d/netif restart'
alias shootme='DISPLAY=:0 import -window root ~/Pictures/scrots/scrot-$(date +%m-%d-%Y-%H-%M-%S).png'
alias blankcd='cdrdao blank'
alias zzz=slock
alias g='git'
alias gc='git commit -m "adds and tweaks"'
alias ping='ping -c3'
