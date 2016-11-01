#!/bin/mksh

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
    disk=$(df -h / | awk 'NR==2 {total=$2; used=$3; print used" / "total}')
    color-echo 'DISK' '     '"$disk"
}

print-mem() {
    mem=$(top | grep Memory | awk -F ' ' '{ print $3 }')
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

print-distro() {
	PRETTY_NAME=$(uname)
	if [[ -n "$PRETTY_NAME" ]]; then
        color-echo 'OS' '       '"$PRETTY_NAME"
	else
        color-echo 'OS' '       '"not found"
	fi
}

print-date() {
	T_DATE=$(date)
        color-echo 'DATE' '     '"$T_DATE"
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
print-date
print-distro
print-packages
#printf "\n"
print-wm
print-shell
print-term
#printf "\n"
print-font
colors='Gotham'
printf "\e[36mCOLORS: \e[0m   $colors$rst\n"
#printf "\n"
print-font
print-disk
print-mem
print-kernel
print-cpu
print-colors
read
