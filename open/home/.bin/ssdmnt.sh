#! /bin/sh

# Mount SSD
# sysctl hw.disknames
# dmesg | grep sd1
# disklabel sd1

doas mount /dev/sd1k /mnt/sd1
