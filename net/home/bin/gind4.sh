#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group4=""

if [ -f $FSDIR/4 ];
    then group4="1"
    else group4="0"
fi

echo "$group4"

