#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group6=""

if [ -f $FSDIR/6 ];
    then group6="1"
    else group6="0"
fi

echo "$group6"

