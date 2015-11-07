#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups.sh}
group4=""

if [ -f $FSDIR/group.4 ];
    then group4="1"
    else group4="0"
fi

echo "$group4"

