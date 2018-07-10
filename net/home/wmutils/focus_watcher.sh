#!/bin/sh
#
# z3bra - 2014 (c) wtfpl
# focus a window when it is created
# depends on: focus.sh

while IFS=: read ev wid; do
    case $ev in
        # click on window
        4)
            if ! wattr o $wid; then
                wattr "$wid" && focus.sh &
            fi
            ;;

        # window creation
        16)
            if ! wattr o $wid; then
                middles.sh center "$wid"
            fi
            ;;

        # mapping requests (show window)
        19)

            if ! wattr o $wid; then
                    focus.sh "$wid"
            fi
            ;;
    esac
done
