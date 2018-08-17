#!/bin/sh
# Author: stark <stark at openmailbox dot org>
# goco -- Simple script for extracting color codes from Xresource database

# Comment this var if you do not want to strip '#' from the color codes
RM_PREFIX='-F#'

# Script name
PROGNAME="$(basename $0)"

_usage() {
	cat <<- HELP
    $PROGNAME <options>

Options:

    bg      - Display the background color
    fg      - Display the foreground color
    0 to 7  - Display the normal colors
    8 to 15 - Display the bold   colors

    You can also use names instead of color numbers:
      0    1    2    3    4    5    6    7
    blkf redf grnf ylwf bluf magf cynf whtf
    blkb redb grnb ylwb blub magb cynb whtb
      8    9   10   11   12   13   14   15

Examples:

    Display color 2 (grnf) and color 3 (ylwf)
    $PROGNAME 2 3

    Same as above just using their equivalent names instead of numbers
    $PROGNAME grnf ylwf

    Displays all the 18 colors along with background and foreground:
    $PROGNAME bg fg \`seq 0 15\`

	HELP
}

[ $# -lt 1 ] && printf "Error: %s\n" 'No options specified' && _usage && exit 1

# Color query
colq() {
	xrdb -query | awk -v query="${1}:" $RM_PREFIX '$1 ~ query { print $NF }'
}

for OPT in $@; do
	case $OPT in
		bg)
			colq background
			;;
		fg)
			colq foreground
			;;
		blkf | 0)
			colq color0
			;;
		redf | 1)
			colq color1
			;;
		grnf | 2)
			colq color2
			;;
		ylwf | 3)
			colq color3
			;;
		bluf | 4)
			colq color4
			;;
		magf | 5)
			colq color5
			;;
		cynf | 6)
			colq color6
			;;
		whtf | 7)
			colq color7
			;;
		blkb | 8)
			colq color8
			;;
		redb | 9)
			colq color9
			;;
		grnb | 10)
			colq color10
			;;
		ylwb | 11)
			colq color11
			;;
		blub | 12)
			colq color12
			;;
		magb | 13)
			colq color13
			;;
		cynb | 14)
			colq color14
			;;
		whtb | 15)
			colq color15
			;;
		*)
			printf 'Error: %s\n' 'Invalid color number/name'
			_usage && exit 1
			;;
	esac
done

exit $?
# vim: set ft=sh noet:
