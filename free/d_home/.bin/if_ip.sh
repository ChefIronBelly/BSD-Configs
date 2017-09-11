#!/bin/sh

if="re0"

/sbin/ifconfig $if 2>/dev/null | grep "inet " | awk '{print $2}' | tr '\n' ' ' 
