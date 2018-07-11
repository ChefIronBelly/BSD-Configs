#!/bin/sh

file=fcs

while IFS=: read ev wid; do
    case $ev in
        # window creation
        16) wattr o $wid || corner md $wid 
        test "$(lsw)" = "$wid" ;;

        # mapping requests
        19) wattr o $wid \
            || $file $wid ;;

        # focus next window when deleting focused window
        18) wattr $(pfw) || $file prev 2>/dev/null
            test -z "$(lsw)" ;;

        # entering window
        7) wattr o $wid || $file $wid ;;
    esac
done
