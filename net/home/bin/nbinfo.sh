#!/usr/pkg/bin/mksh

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
	echo -e "$grn$1: $rst$2"
}

print-kernel() {
	color-echo 'Kernel' '-------- '"$(uname -mrs)"
}

print-shell() {
	fshell=$(echo $SHELL | cut -d '/' -f 5)
	color-echo 'Shell' '--------- '"$fshell"
}

print-term() {
	color-echo 'Term' '---------- '"$TERM"
}

print-cpu() {
	cpu=$(awk -F': ' '/model name/ {gsub("\\(R\\)",""); gsub("\\(TM\\)",""); print $2; exit}' /proc/cpuinfo)
	color-echo 'CPU' '----------- '"$cpu"
}

print-packages() {
	pkgs=$(pkg_info | wc -l | awk '{sub(" ", "");print $1}')
	color-echo 'Packages' '------ '"$pkgs"
}

print-wm() {
    for wm in ${wms[@]}; do          # pgrep through wmname array
        pid=$(pgrep -x -u $USER $wm)		# if found, this wmname has running process
        if [[ "$pid" ]]; then
            color-echo 'WM' ' ----------- '"$wm"
	        break
        fi
    done
    color-echo 'WM' '------------ ''nul, wmutils active'
}
           
print-font() {
    fontstr=$(xrdb -query 2>/dev/null | grep '*faceName:')
    font=$(echo $fontstr | awk -F: '{ print $3 }')
    [[ $font != "" ]] && color-echo Font '---------- '"$font"
}

print-distro() {
	PRETTY_NAME=$(uname)
	if [[ -n "$PRETTY_NAME" ]]; then
        color-echo 'OS' '------------ '"$PRETTY_NAME"
	else
        color-echo 'OS' '------------ '"not found"
	fi
}

print-gitdir() {
	gitdir="/ChefIronBelly"
	color-echo 'Github' '-------- '"$gitdir"
}

clear
echo -e "\n$prp$USER@$(hostname)$rst\n"
print-distro
print-packages
echo
print-wm
print-shell
print-term
print-font
echo
print-kernel
print-cpu
echo
print-gitdir
echo
