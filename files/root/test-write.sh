#!/bin/sh

while true; do
    if=/dev/urandom
    of=/tmp/write-$(printf %03d $(expr $RANDOM % 100))
    dd if=$if of=$of count=4096
done
