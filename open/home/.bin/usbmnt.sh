#! /bin/sh

# Mount usb
# sysctl hw.disknames
# dmesg | grep sd6
# disklabel sd6

doas mount_msdos /dev/sd6i /mnt/usb
