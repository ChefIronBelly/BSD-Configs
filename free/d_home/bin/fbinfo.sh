#!/usr/local/bin/bash

# based on the work of pidsley/codemangler and screenFetch.
# https://github.com/pidsley/codemangler
# https://github.com/KittyKatt/screenFetch

# simple screen information script
# similar to archey and screenfetch without annoying ASCII graphics

# this script is provided with NO GUARANTEE and NO SUPPORT 
# if it breaks or does not do what you want, FIX IT YOURSELF

VERSION="0.1"

# define colors for color-echo
red="\e[1;31m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
blu="\e[34m"
prp="\e[35m"
rst="\e[0m"

# or use wm array -- add any that need to be recognized
wms=( 2bwm 2wm 9wm aewm afterstep ahwm alopex amiwm antiwm awesome blackbox bspwm catwm clfswm ctwm cwm dminiwm dragonflywm dwm echinus \
    euclid-wm evilpoison evilwm fluxbox flwm fvwm-crystal goomwwm hcwm herbstluftwm i3 icewm jwm karmen larswm lwm matwm2 mcwm monsterwm \
    musca notion nwm olwm openbox oroborus pekwm ratpoison sapphire sawfish sscrotwm sithwm smallwm snapwm spectrwm stumpwm subtle swm tfwm tinywm tritium twm \
    uwm vtwm w9wm weewm wind windowlab wm2 wmaker wmfs wmii wmx xfwm4 xmonad xoat yeahwm )

color-echo() {  # print with colors
	echo -e "$red$1: $rst$2"
}

print-kernel() {
	color-echo 'Kernel' "$(uname -mrs)"
}

print-uptime() {
	unset uptime
	boot=$(sysctl -n kern.boottime | cut -d "=" -f 2 | cut -d "," -f 1)
	now=$(date +%s)
	uptime=$(($now-$boot))
	secs=$((${uptime}%60))
	mins=$((${uptime}/60%60))
	hours=$((${uptime}/3600%24))
	days=$((${uptime}/86400))
	uptime="${mins}m"
	if [ "${hours}" -ne "0" ]; then
		uptime="${hours}h ${uptime}"
	fi
	if [ "${days}" -ne "0" ]; then
		uptime="${days}d ${uptime}"
	fi
	color-echo 'Uptime' "$uptime"
}

print-shell() {
	color-echo 'Shell' "$SHELL"
}

print-tzone() {
	tzone=$(date | awk '{ print $5 }')
	color-echo 'Time Zone' "$tzone"
}

print-term() {
	color-echo 'Term' "$TERM"
}

print-language() {
	color-echo 'Language' "$LANG"
}

print-cpu() {
	cpu=$(sysctl hw.model)
	cpu_mhz=$(sysctl hw.clockrate | awk '{print $2}')
		if [ $(echo $cpu_mhz | cut -d. -f1) -gt 999 ];then
		cpu_ghz=$(awk '{print $1/1000}' <<< "${cpu_mhz}")
		cpu="$cpu @ ${cpu_ghz}GHz"
	else
		cpu="$cpu @ ${cpu_mhz}MHz"
	fi
	color-echo 'CPU' "${cpu#*: }" # everything after colon is processor name
}

print-disk() {
	totaldisk=$(df -h -c 2>/dev/null | tail -1)
	disktotal=$(awk '{print $2}' <<< "${totaldisk}")
	diskused=$(awk '{print $3}' <<< "${totaldisk}")
	diskusedper=$(awk '{print $5}' <<< "${totaldisk}")
	diskusage="${diskused} / ${disktotal} (${diskusedper})"
	diskusage_verbose=$(sed 's/%/%%/' <<< $diskusage)
	color-echo 'Disk' "$diskusage"
}

print-packages() {
	pkgs=$(if TMPDIR=/dev/null ASSUME_ALWAYS_YES=1 PACKAGESITE=file:///nonexistent pkg info pkg >/dev/null 2>&1; then 
	pkg info | wc -l | awk '{print $1}'; else pkg_info | wc -l | awk '{sub(" ", "");print $1}'; fi)
	
	color-echo 'Packages' "$pkgs"
}

print-gpu () {
	gpu_info=$(pciconf -lv 2> /dev/null | grep -B 4 VGA)
	gpu_info=$(grep -E 'device.*=.*' <<< "${gpu_info}")
	gpu="${gpu_info##*device*= }"
	gpu="${gpu//\'}"
		
	if [ -n "$gpu" ];then
		if [ $(grep -i nvidia <<< "${gpu_info}" | wc -l) -gt 0 ];then
			gpu_info="NVidia "
		elif [ $(grep -i intel <<< "${gpu_info}" | wc -l) -gt 0 ];then
			gpu_info="Intel "
		elif [ $(grep -i amd <<< "${gpu_info}" | wc -l) -gt 0 ];then
			gpu_info="AMD "
		elif [[ $(grep -i ati <<< "${gpu_info}" | wc -l) -gt 0  || $(grep -i radeon <<< "${gpu_info}" | wc -l) -gt 0 ]]; then
			gpu_info="ATI "
		else
			gpu_info=$(cut -d ':' -f2 <<< "${gpu_info}")
			gpu_info="${gpu_info:1} "
		fi
		gpu="${gpu}"
	else
		gpu="Not Found"
	fi
	color-echo 'GPU' "$gpu"
}

print-mem() {
	free_mem=0
	human=1024
	phys_mem=$(sysctl -n hw.physmem)
	size_mem=$phys_mem
	size_chip=1
	guess_chip=`echo "$size_mem / 8 - 1" | bc`
	while [ $guess_chip != 0 ]; do
		guess_chip=`echo "$guess_chip / 2" | bc`
		size_chip=`echo "$size_chip * 2" | bc`
	done
	round_mem=`echo "( $size_mem / $size_chip + 1 ) * $size_chip " | bc`
	totalmem=$(($round_mem / ($human * $human) ))
	pagesize=$(sysctl -n hw.pagesize)
	inactive_count=$(sysctl -n vm.stats.vm.v_inactive_count)
	inactive_mem=$(($inactive_count * $pagesize))
	cache_count=$(sysctl -n vm.stats.vm.v_cache_count)
	cache_mem=$(($cache_count * $pagesize))
	free_count=$(sysctl -n vm.stats.vm.v_free_count)
	free_mem=$(($free_count * $pagesize))
	avail_mem=$(($inactive_mem + $cache_mem + $free_mem))
	used_mem=$(($round_mem - $avail_mem))
	usedmem=$(($used_mem / ($human * $human) ))
	mem="${usedmem}MB / ${totalmem}MB"
	color-echo 'Mem' "$mem"
}

print-wm() {
	wm="nul, wmutils active"
    for wm in ${wms[@]}; do          # pgrep through wmname array
        pid=$(pgrep -x -u $USER $wm)		# if found, this wmname has running process
        if [[ "$pid" ]]; then
            color-echo 'WM' "$wm"
	        break
        fi
    done
#    color-echo 'WM' 'nul, wmutils active'
}

print-font() {
    fontstr=$(xrdb -query 2>/dev/null | grep '*faceName:')
    if [[ $fontstr =~ face ]]; then # using an xft font
        d=':'
    else # using bitmap font
        d='-'
    fi
    font=$(echo $fontstr | awk -F$d '{ print $2 }')
    [[ $font != "" ]] && color-echo Font "$font"
}

print-de() {
    if [[ $(pgrep -a lxsession) ]]; then         # if lxsession is running, assume LXDE
        color-echo DE LXDE
    elif [[ $(pgrep -a xfce4-session) ]]; then   # if xfce4-session is running, assume Xfce
        color-echo DE Xfce
    fi
}

print-distro() {
	PRETTY_NAME=$(uname)
	if [[ -n "$PRETTY_NAME" ]]; then
        color-echo 'OS' "$PRETTY_NAME"
	else
        color-echo 'OS' "Not Found"
	fi
}

print-colors() {
	COLORS=('█' '█' '█' '█' '█' '█' '█' '█ ')
	for f in {0..7}; do
        echo -en "\033[m\033[$(($f+30))m ${COLORS[$f]} " # normal colors
	done
	echo
	for f in {0..7}; do
        echo -en "\033[m\033[1;$(($f+30))m ${COLORS[$f]} " # bold colors
	done
	echo -e "$rst\n"
}

	if [[ $1 = '-v' ]]; then # print version information and exit
	echo $(basename "$0") / version: $VERSION / wm count: ${#wms[*]} 
	exit
	fi

clear
echo -e "\n$prp$USER@$HOSTNAME$rst\n"
print-distro
print-uptime
print-shell
print-term
print-font
print-tzone
print-language
print-de
print-wm
print-packages
print-disk
print-mem
print-kernel
print-cpu
print-gpu
echo
print-colors
