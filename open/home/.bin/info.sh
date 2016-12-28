#!/usr/bin/env bash

# define colors for color-echo
red="\e[31m"
grn="\e[32m"
org="\e[33m"
blu="\e[34m"
prp="\e[35m"
cyn="\e[36m"
wht="\e[37m"
rst="\e[0m"

f1="\e[0;007m"
f2="\e[0;37m"

# or use wm array -- add any that need to be recognized
wms=( 2bwm 9wm bspwm catwm cwm dminiwm dwm evilwm fluxbox i3 icewm jwm openbox ratpoison swm twm \
    w9wm wmfs wmii wmutils )

color-echo() {  # print with colors
	echo -e "$cyn$1: $wht$2"
}

print-distro() {
	color-echo 'OS' '       '"$(uname -mrs)"
}

print-shell() {
  shell="${SHELL##*/}"
  shell+=" "
  shell+="$("$SHELL" -c 'printf "%s" "$KSH_VERSION"')"
  shell="${shell/ * KSH}"
	shell="${shell/\(*\)}"	
  color-echo 'SHELL' '    '"$shell"
}

print-term() {
	color-echo 'TERM' '     '"$TERM"
}

print-cpu() {
	cpu=$(sysctl hw.model | sed -r 's/^.{9}//' | sed 's/("GenuineIntel" 686-class)//')
	color-echo 'CPU' '      '"$cpu"
}

print-packages() {
	pkgs=$(pkg_info | wc -l | awk '{sub(" ", "");print $1}')
	color-echo 'PACKAGES' ' '"$pkgs"
}

print-disk() {
    # field 2 on line 2 is total, field 3 on line 2 is used
  disk=$(df -h /home | awk 'NR==2 {total=$2; used=$3; print used" / "total}')
  color-echo 'DISK' '     '"$disk"
}

print-mem() {
	memtotal="$(($(sysctl -n hw.physmem) / 1024 / 1024))"
	memused="$(($(vmstat | awk 'END {printf $4}') / 1024))"
  mem="${memused}MB / ${memtotal}MB"
  color-echo 'MEM' '      '"$mem"
}

print-wm() {
    for wm in ${wms[@]}; do          # pgrep through wmname array
        pid=$(pgrep -x -u $USER $wm)		# if found, this wmname has running process
        if [[ "$pid" ]]; then
            color-echo 'WM' '       '"$wm"
	        break
        fi
    done
    #color-echo 'WM' '       '"Not Found / wmutils active"
}
           
print-font() {
  fontstr=$(xrdb -query 2>/dev/null | grep '*font:')
  font=$(echo $fontstr | awk -F: '{ print $4 }')
  [[ $font != "" ]] && color-echo 'FONT' '     '"$font"
}

print-gpu() {
# stolen from neofetch
	gpu="$(glxinfo | grep -F 'OpenGL renderer string')"
  gpu="${gpu/'OpenGL renderer string: '}"
	color-echo 'GPU' '      '"$gpu"
}	

print-date() {
	time=$(date +" %a, %b %d %I:%M")
  color-echo 'DATE' '    '"$time"
}

print-colors() {
#█▓▒░ colors 
printf "\n"
i=0
while [ $i -le 6 ]
do
  printf "\e[$((i+30))m░▒▓█"
  i=$(($i+1))
done
printf "\e[37m░▒▓█\n"
# ascii bit by xero
}

clear
printf "\e[41m$USER@$(hostname)$rst\n"
printf "\n"
#print-date
print-distro
print-packages
#printf "\n"
print-wm
print-shell
print-term
#printf "\n"
print-font
colors='base16-dark'
printf "\e[36mCOLORS: \e[37m   $colors$rst\n"
#printf "\n"
print-font
print-disk
print-mem
print-cpu
print-gpu
#print-colors
read
