#!/bin/sh

envstat -f | grep "cpu0 temperature: " | awk '{print $3}' | tr '\n' ' '
