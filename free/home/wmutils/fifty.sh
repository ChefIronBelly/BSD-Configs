#!/bin/sh
# 
# orig by franksn
# puts focused window to fifty percent size and then to left, right, top, or bottom.

ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)
BW=$(wattr b $(pfw))
GAP=${GAP:-10}
PANEL=${PANEL:-20}

# it's pretty simple, but anyway...
usage() {
    echo "usage: $(basename $0) <left|right|up|down>"
    exit 1
}

# exit if no argument given
test -z "$1" && usage

case $1 in
  left) wtp $GAP $((GAP + PANEL)) $((SW/2 - GAP - 2*BW)) $((SH - PANEL - 2*BW - 2*GAP)) $(pfw) ;;
  right) wtp $((SW/2 + GAP)) $((GAP + PANEL)) $((SW/2 - 2*GAP - 2*BW)) $((SH - PANEL - 2*BW - 2*GAP)) $(pfw) ;;
  up) wtp $GAP $((GAP + PANEL)) $((SW - 2*GAP - 2*BW )) $((SH/2 - GAP - 2*BW)) $(pfw) ;;
  down) wtp $GAP  $((SH/2 + GAP + PANEL)) $((SW - 2*GAP - 2*BW)) $((SH/2 - PANEL - 2*GAP - 2*BW)) $(pfw) ;;
esac
