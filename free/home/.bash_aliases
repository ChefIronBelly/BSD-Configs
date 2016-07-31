# .bash_aliases

alias upg='sudo freebsd-update fetch install'
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
alias reboot='sudo /sbin/shutdown -r now'
alias poweroff='sudo /sbin/shutdown -h now'
alias shutdown='sudo /sbin/shutdown -h now'

alias ls='ls -G'
#alias la='ls -A'
alias ll='ls -lG'

alias grep='grep --color=auto'

alias md='mkdir -p -v'
alias rd='rmdir -v'

alias manb='man -H'

#### My Adds
alias info='debinfo.sh'
alias rec='ffmpeg -f x11grab -s 1440x900 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'
alias todo='vi ~/todo'
alias rnet='sudo /etc/rc.d/netif restart'
alias shootme='DISPLAY=:0 import -window root ~/Pictures/scrots/scrot-$(date +%m-%d-%Y-%H-%M-%S).png'
alias blankcd='cdrdao blank'
alias zzz=slock
alias wet=curl -4 wttr.in
