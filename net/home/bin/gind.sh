#!/bin/sh

FSDIR=${FSDIR:-/tmp/grp}
group1=""
group2=""
group3=""
group4=""
group5=""
group6=""
group7=""
group8=""

if [ -f $FSDIR/1 ];
    then group1="1"
    else group1="0"
fi

if [ -f $FSDIR/2 ];
    then group2="1"
    else group2="0"
fi

if [ -f $FSDIR/3 ];
    then group3="1"
    else group3="0"
fi

if [ -f $FSDIR/4 ];
    then group4="1"
    else group4="0"
fi

if [ -f $FSDIR/5 ];
    then group5="1"
    else group5="0"
fi

if [ -f $FSDIR/6 ];
    then group6="1"
    else group6="0"
fi

if [ -f $FSDIR/7 ];
    then group7="1"
    else group7="0"
fi

if [ -f $FSDIR/8 ];
    then group8="1"
    else group8="0"
fi

echo "$group8"
echo "$group7"
echo "$group6"
echo "$group5"
echo "$group4"
echo "$group3"
echo "$group2"
echo "$group1"
