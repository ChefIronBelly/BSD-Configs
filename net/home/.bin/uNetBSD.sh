#!/usr/pkg/bin/bash
#
# unpack NetBSD daily sets
#
# depends: common sense
### work in progress ###

set -e
set -x

cd /
pwd
read

cp /netbsd /netbsd.old

for file in modules base comp man text xbase xcomp xetc xfont xserver
do
	tar zxpf /home/chef/HEAD/latest/${file}.tar.xz
done

# hand job this you lazy bastage #

# /usr/sbin/postinstall -s /home/chef/HEAD/etc.tar.xz check
# /usr/sbin/postinstall -s /home/chef/HEAD/etc.tar.xz fix
# /usr/sbin/etcupdate -s /home/chef/HEAD/etc.tar.xz
