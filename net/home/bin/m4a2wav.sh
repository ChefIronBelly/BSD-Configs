#!/usr/pkg/bin/mksh
LAMEOPTS="-p -o -v -V 5 -h"

for FILE in *.m4a ; do
    OUTNAME=`basename "$FILE" .m4a`.mp3
    lame $LAMEOPTS "$FILE" "$OUTNAME"
done
