#!/bin/sh

ifconfig fxp0 | grep "inet " | awk '{print $2}' | tr '\n' ' '

