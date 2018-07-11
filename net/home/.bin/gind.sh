#!/bin/sh

FSDIR=${FSDIR:-/tmp/groups}
group1=""
group2=""
group3=""
group4=""

if [ ! “$(ls -A “$FSDIR/1”)” ];
    then group1="0"
    else group1="1"
fi

if [ ! “$(ls -A “$FSDIR/2”)” ];
    then group2="0"
    else group2="1"
fi

if [ ! “$(ls -A “$FSDIR/3”)” ];
    then group3="0"
    else group3="1"
fi

if [ ! “$(ls -A “$FSDIR/4”)” ];
    then group4="0"
    else group4="1"
fi

echo "$group4""$group3""$group2""$group1"

