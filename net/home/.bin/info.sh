#!/usr/pkg/bin/bash

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
wms=( 2bwm 2wm 9wm aewm afterstep ahwm alopex amiwm antiwm awesome blackbox bspwm catwm clfswm ctwm cwm dminiwm dragonflywm dwm echinus \
    euclid-wm evilpoison evilwm fluxbox flwm fvwm-crystal goomwwm hcwm herbstluftwm i3 icewm jwm karmen larswm lwm matwm2 mcwm monsterwm \
    musca notion nwm olwm openbox oroborus pekwm ratpoison sapphire sawfish sscrotwm sithwm smallwm snapwm spectrwm stumpwm subtle swm tfwm tinywm tritium twm \
    uwm vtwm w9wm weewm wind windowlab wm2 wmaker wmfs wmii wmx xfwm4 xmonad xoat yeahwm )

color-echo() {  # print with colors
	echo -e "$blu$1: $wht$2"
}

print-kernel() {
	color-echo 'KERNEL' '   '"$(uname -mrs)"
}

print-shell() {
	#fshell=$(echo $SHELL | cut -d '/' -f 5)
	fshell=$(echo $SHELL)
	color-echo 'SHELL' '    '"$fshell"
}

print-term() {
	color-echo 'TERM' '     '"$TERM"
}

print-cpu() {
	cpu=$(awk -F': ' '/model name/ {gsub("\\(R\\)",""); gsub("\\(TM\\)",""); print $2; exit}' /proc/cpuinfo)
	color-echo 'CPU' '      '"$cpu"
}

print-packages() {
	pkgs=$(pkg_info | wc -l | awk '{sub(" ", "");print $1}')
	color-echo 'PACKAGES' ' '"$pkgs"
}

print-disk() {
    # field 2 on line 2 is total, field 3 on line 2 is used
    disk=$(df -h / | awk 'NR==2 {total=$2; used=$3; print used" / "total}')
    color-echo 'DISK' '     '"$disk"
}

print-mem() {
	memtotal="$(($(sysctl -n hw.physmem64) / 1024 / 1024))"
	memused="$(($(vmstat | awk 'END {printf $3}') / 1024))"
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
    fontstr=$(xrdb -query 2>/dev/null | grep '*.font:')
    font=$(echo $fontstr | awk -F: '{ print $2 }')
    [[ $font != "" ]] && color-echo 'FONT' '    '"$font"
}

print-distro() {
	PRETTY_NAME=$(uname)
	if [[ -n "$PRETTY_NAME" ]]; then
        color-echo 'OS' '       '"$PRETTY_NAME"
	else
        color-echo 'OS' '       '"not found"
	fi
}

print-colors() {
#█▓▒░ colors 
printf "\n"
i=0
while [ $i -le 6 ]
do
  printf "\e[$((i+30))m░▒▓█▓▒░"
  i=$(($i+1))
done
printf "\e[37m░▒▓█▓▒░\e[0m\n\n"
# ascii bits by xero
}

clear
printf "\n$red$USER@$(hostname)$rst\n"
printf "\n"
print-distro
print-packages
#printf "\n"
print-wm
print-shell
print-term
#printf "\n"
print-font
colors='nord'
printf "\e[34mCOLORS: \e[37m   $colors$rst\n"
#printf "\n"
print-disk
print-mem
print-kernel
print-cpu
print-colors
read
