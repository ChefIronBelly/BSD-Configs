#!/usr/pkg/bin/bash
#
# Get NetBSD daily sets
#
# depends: curl and common sense

set -e
set -x

mkdir /home/chef/HEAD/$1 && cd $_

for file in kern-GENERIC modules base comp etc man text xbase xcomp xetc xfont xserver
do
    curl -C - -LO http://nyftp.netbsd.org/pub/NetBSD-daily/HEAD/$1/amd64/binary/sets/${file}.tgz
done
