#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group1=""
group2=""
group3=""
group4=""

if [ -f $FSDIR/1 ];
    then group1="+"
    else group1="-"
fi

if [ -f $FSDIR/2 ];
    then group2="+"
    else group2="-"
fi

if [ -f $FSDIR/3 ];
    then group3="+"
    else group3="-"
fi

if [ -f $FSDIR/4 ];
    then group4="+"
    else group4="-"
fi

echo "$group4""$group3""$group2""$group1"
