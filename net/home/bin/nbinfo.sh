#!/usr/pkg/bin/bash

# define colors for color-echo
red="\e[1;31m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
blu="\e[34m"
prp="\e[35m"
rst="\e[0m"

f1="\e[0;007m"
f2="\e[0;37m"

# or use wm array -- add any that need to be recognized
wms=( 2bwm 2wm 9wm aewm afterstep ahwm alopex amiwm antiwm awesome blackbox bspwm catwm clfswm ctwm cwm dminiwm dragonflywm dwm echinus \
    euclid-wm evilpoison evilwm fluxbox flwm fvwm-crystal goomwwm hcwm herbstluftwm i3 icewm jwm karmen larswm lwm matwm2 mcwm monsterwm \
    musca notion nwm olwm openbox oroborus pekwm ratpoison sapphire sawfish sscrotwm sithwm smallwm snapwm spectrwm stumpwm subtle swm tfwm tinywm tritium twm \
    uwm vtwm w9wm weewm wind windowlab wm2 wmaker wmfs wmii wmx xfwm4 xmonad xoat yeahwm )

color-echo() {  # print with colors
	echo -e "$red$1: $rst$2"
}

print-kernel() {
	color-echo 'Kernel' '........ '"$(uname -mrs)"
}

print-shell() {
	color-echo 'Shell' '......... '"$SHELL"
}

print-tzone() {
	tzone=$(date | awk '{ print $5 }')
	color-echo 'Time Zone' "$tzone"
}

print-term() {
	color-echo 'Term' '.......... '"$TERM"
}

print-language() {
	color-echo 'Language' $LANG
}

print-cpu() {
	cpu=$(awk -F': ' '/model name/ {gsub("\\(R\\)",""); gsub("\\(TM\\)",""); print $2; exit}' /proc/cpuinfo)
	color-echo 'CPU' '........... '"$cpu"
}

print-disk() {
	diskusage="Unknown"
	totaldisk=$(df -h / 2>/dev/null | tail -1)
	disktotal=$(awk '{print $2}' <<< "${totaldisk}")
	diskused=$(awk '{print $3}' <<< "${totaldisk}")
	diskusage="${diskused} / ${disktotal}"
	color-echo 'Disk' "$diskusage"
}

print-packages() {
	pkgs=$(pkg_info | wc -l | awk '{sub(" ", "");print $1}')
	color-echo 'Packages' '...... '"$pkgs"
}

print-mem() {
	hw_mem=0
	free_mem=0	
	human=1024
	phys_mem=$(awk '/MemTotal/ { print $2 }' /proc/meminfo)
	totalmem=$((${phys_mem} / $human))
	if grep -q 'Cached' /proc/meminfo; then
		cache=$(awk '/Cached/ {print $2}' /proc/meminfo)
		usedmem=$((${cache} / $human))
	else
		free_mem=$(awk '/MemFree/ { print $2 }' /proc/meminfo)
		used_mem=$((${phys_mem} - ${free_mem}))
		usedmem=$((${used_mem} / $human))
	fi
	mem="${usedmem}MB / ${totalmem}MB"
	color-echo 'Mem' "$mem"
}

print-wm() {
    for wm in ${wms[@]}; do          # pgrep through wmname array
        pid=$(pgrep -x -u $USER $wm)		# if found, this wmname has running process
        if [[ "$pid" ]]; then
            color-echo 'WM' ' ........... '"$wm"
	        break
        fi
    done
    color-echo 'WM' '............ ''nul, wmutils active'
}
           
print-font() {
    fontstr=$(xrdb -query 2>/dev/null | grep '*faceName:')
    if [[ $fontstr =~ xft ]]; then # using an xft font
        d=':'
    else # using bitmap font
        d='-'
    fi
    font=$(echo $fontstr | awk -F$d '{ print $3 }')
    [[ $font != "" ]] && color-echo Font '.......... '"$font"
}

print-distro() {
	PRETTY_NAME=$(uname)
	if [[ -n "$PRETTY_NAME" ]]; then
        color-echo 'OS' '............ '"$PRETTY_NAME"
	else
        color-echo 'OS' '............ '"not found"
	fi
}

print-gitdir() {
	gitdir="/ChefIronBelly"
	color-echo 'Github' '........ '"$gitdir"
}

print-colors() {
	COLORS=('' '' '' '' '' '' '' '')
	for f in {0..7}; do
        echo -en "\033[m\033[$(($f+30))m ${COLORS[$f]} " # normal colors
	done
	echo
	for f in {0..7}; do
        echo -en "\033[m\033[1;$(($f+30))m ${COLORS[$f]} " # bold colors
	done
	echo -e "$rst\n"
}

print-xcolors() {
echo -e '\n\e[00;30m ██ \e[00;31m ██ \e[0;32m ██ \e[00;30m ██ \e[0;34m ██ \e[00;35m ██ \e[0;36m ██ \e[00;37m ██'
}

print-sword() {
echo -e '\n\e[00;37m @xxxx[{::::::::::::::::::::::::::::::::::>'
}

clear
echo -e "\n$red$USER@$HOSTNAME$rst\n"
print-distro
print-packages
#print-uptime
echo
print-wm
print-shell
print-term
print-font
#print-tzone
#print-language
echo
#print-disk
#print-mem
print-kernel
print-cpu
echo
print-gitdir
#print-xcolors
#print-sword
#print-colors
echo
