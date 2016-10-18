#!/bin/sh

# use the google translate service
# depends: curl

if test -z "$1"; then
    echo "usage: $(basename $0) text"
    echo "examples:"
    echo "    $(basename $0) text"
    echo "    TL=el $(basename $0) text"
    echo "    SL=en TL=pl $(basename $0) text"
    exit 1
fi

TEXT=$1
SL=${SL:-auto}
TL=${TL:-fr}

TRANSLATEURL='https://translate.google.com/'
UA='Mozilla 5.0'
NEWLINE='\
'

# do translate
curl --user-agent "$UA" \
    --data "sl=$SL" \
    --data "tl=$TL" \
    --data-urlencode "text=$TEXT" \
    --silent $TRANSLATEURL \
    | sed "s/<\/span>/$NEWLINE/g" | grep 'result_box' | sed 's/.*>//'
