#!/bin/sh

# it's pretty simple, but anyway...
usage() {
    echo "usage: $(basename $0) <filename.iso>"
    exit 1
}

# exit if no argument given
test -z "$1" && usage

sudo cdrecord dev=/dev/rcd0d -data -pad -v $1
