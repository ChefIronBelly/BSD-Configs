#!/bin/sh

R=$(lsw -r)
W=$(wattr w $R)
H=$(wattr h $R)
B=$(wattr b $(pfw))
WIDTH=$((W / 2))
HEIGHT=$((H / 2))
GAP=${GAP:-20}
PANEL=${PANEL:-20}

usage() {
    echo "usage: $(basename $0) <left|right|up|down>" >&2
    exit 1
}

case $1 in
  left) wtp $GAP $((GAP + PANEL)) $((WIDTH - GAP - 2*B)) $((H - PANEL - 2*GAP)) $(pfw) ;;
  right) wtp $((WIDTH + GAP)) $((GAP + PANEL)) $((WIDTH - 2*GAP - 2*B)) $((H - PANEL - 2*GAP)) $(pfw) ;;
  up) wtp $GAP $((GAP + PANEL)) $((W - 2*GAP - 2*B )) $((HEIGHT - GAP - 2*B)) $(pfw) ;;
  down) wtp $GAP $((HEIGHT + GAP + PANEL)) $((W - 2*GAP - 2*B)) $((HEIGHT - 2*GAP - 2*B)) $(pfw) ;;
  *) usage ;;
esac
