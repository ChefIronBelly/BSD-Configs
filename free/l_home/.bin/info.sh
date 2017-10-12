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

print-kernel() {
	color-echo 'KERNEL' '   '"$(uname -mrs)"
}

print-shell() {
    color-echo 'SHELL' '    '"$SHELL"
}

print-term() {
	color-echo 'TERM' '     '"$TERM"
}

print-temp() {
	temp=$(sysctl -n dev.cpu.0.temperature | awk '{print $1*9/5+32}')
	color-echo 'TEMP' '     '"$temp""F"
}

print-cpu() {
	cpu=$(sysctl hw.model | sed -r 's/^.{9}//' | sed 's/("GenuineIntel" 686-class)//')
	color-echo 'CPU' '     '"$cpu"
}

print-packages() {
	pkgs=$(if TMPDIR=/dev/null ASSUME_ALWAYS_YES=1 PACKAGESITE=file:///nonexistent pkg info pkg >/dev/null 2>&1; then 
	pkg info | wc -l | awk '{print $1}'; else pkg_info | wc -l | awk '{sub(" ", "");print $1}'; fi)
	
	color-echo 'PACKAGES' ' '"$pkgs"
}

print-disk() {
    # field 2 on line 2 is total, field 3 on line 2 is used
    disk=$(df -h / | awk 'NR==2 {total=$2; used=$3; print used" / "total}')
    color-echo 'DISK' '     '"$disk"
}

print-mem() {
	# requires freecolor Im lazy today.
	totalmem=$( freecolor -mo | awk 'NR==2 {print substr($2,0,4)}')
	usedmem=$( freecolor -mo | awk 'NR==2 {print substr($3,0,3)}')
	mem="${usedmem}MB / ${totalmem}MB"
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
    fontstr=$(xrdb -query 2>/dev/null | grep '*faceName:')
    font=$(echo $fontstr | awk -F: '{ print $3 }')
    [[ $font != "" ]] && color-echo 'FONT' '     '"$font"
}

print-distro() {
	PRETTY_NAME=$(uname)
	if [[ -n "$PRETTY_NAME" ]]; then
        color-echo 'OS' '       '"$PRETTY_NAME"
	else
        color-echo 'OS' '       '"Not Found"
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
printf "\e[34m░▒▓█\e[0m▓▒░\n\n"
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
colors='traffic by dkeg'
printf "\e[36mCOLORS: \e[37m   $colors$rst\n"
#printf "\n"
print-disk
print-mem
print-kernel
print-cpu
#print-temp
#print-colors
read
