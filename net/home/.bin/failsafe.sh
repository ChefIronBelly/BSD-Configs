#!/bin/sh
. /etc/mk.conf

if [ -z $NETBSDSRCDIR ] ; then
    NETBSDSRCDIR=/usr/src
fi
if [ \! -d $NETBSDSRCDIR ] ; then
    echo Unable to find sources
    exit 1
fi
find $NETBSDSRCDIR -name \*.o -o -name obj.\* -o -name obj -exec rm \{\} \;

if [ -z $BSDOBJDIR ] ; then
    BSDOBJDIR=/usr/obj
fi
if [ -d $BSDOBJDIR ] ; then
    rm -rf $BSDOBJDIR
fi

cd $NETBSDSRCDIR && make cleandir
