#!/usr/local/bin/bash

if ! cmus-remote -C >/dev/null 2>&1 ; then
    echo >&2 "cmus is not running"
    exit 1
fi

function get_opt () {
    cmus-remote -C "set $1" | sed -e "s/^setting: '$1=//" -e "s/'$//"
}

function set_opt () {
    cmus-remote -C "set $1=$2"
}

shuffle=$(get_opt "shuffle")
repeat=$(get_opt "repeat")
set_opt "shuffle" "true"
set_opt "repeat" "true"
cmus-remote -C "player-next"
set_opt "shuffle" "$shuffle"
set_opt "repeat" "$repeat"
cmus-remote -C "echo selected random track"
