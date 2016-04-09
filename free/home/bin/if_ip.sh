#!/bin/sh

if="fxp0"

/sbin/ifconfig $if | grep "inet " | awk '{print $2}' | tr '\n' ' '
