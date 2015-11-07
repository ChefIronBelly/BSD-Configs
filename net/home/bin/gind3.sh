#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups.sh}
group3=""

if [ -f $FSDIR/group.4 ];
    then group3="1"
    else group3="0"
fi

echo "$group3"
