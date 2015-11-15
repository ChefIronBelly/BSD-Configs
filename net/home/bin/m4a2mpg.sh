#!/bin/sh
# chef
# convert .m4a to .mpg using ffmpeg

OPTS="-acodec libmp3lame -ac 2 -aq 128k"

for FILE in *.m4a ; do
    OUTNAME=`basename "$FILE" .m4a`.mp3
    ffmpeg2 -i "$FILE" $OPTS "$OUTNAME"
done
