#!/usr/pkg/bin/bash
#
# Get NetBSD daily sets
#
# depends: curl and common sense

set -e
set -x

mkdir /home/chef/HEAD/$1 && cd $_

for file in base comp etc kern-GENERIC modules xbase xcomp xetc xfont xserver
do
    curl -LO http://nyftp.netbsd.org/pub/NetBSD-daily/HEAD/$1/amd64/binary/sets/${file}.tgz
done
