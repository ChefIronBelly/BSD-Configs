#!/bin/sh

envstat -f | grep "cpu1 temperature: " | awk '{print $3}' | tr '\n' ' '
