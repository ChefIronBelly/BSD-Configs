#!/bin/sh

FULL=▓
EMPTY=░
EOL=▒ 
SIZE=7
C0="#0a0f14"
C1="#c33027"
C2="#26a98b"
C3="#edb54b"
C4="#195465"
C5="#4e5165"
C6="#33859d"
C7="#98d1ce"

clock()
{
	mtime=$(date +'%H:%M')
	myear=$(date +'%Y-%m-')
	mday=$(date +'%d')
	echo "#[fg=$C7]#[bg=$C1]█ $mtime"
}

echo `clock`
