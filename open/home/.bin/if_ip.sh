#!/bin/sh

ifconfig re0 | grep "inet " | awk '{print $2}' | tr '\n' ' '

