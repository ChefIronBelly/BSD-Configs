#! /bin/sh

# Mount SSD
# sysctl hw.disknames
# dmesg | grep sd1
# disklabel sd1

sudo mount /dev/sd1k /mnt/sd1
