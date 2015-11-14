#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group5=""

if [ -f $FSDIR/5 ];
    then group5="1"
    else group5="0"
fi

echo "$group5"

