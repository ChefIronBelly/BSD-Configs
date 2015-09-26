#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups.sh}

group4=""

if [ -f $FSDIR/group.4 ];
	then group4=""
    else group4=""
fi

echo "$group4"

