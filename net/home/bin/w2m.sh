#!/usr/pkg/bin/mksh
LAMEOPTS="-p -o -v -V 5 -h"

for FILE in *.wav ; do
    OUTNAME=`basename "$FILE" .wav`.mp3
    lame $LAMEOPTS "$FILE" "$OUTNAME"
done
