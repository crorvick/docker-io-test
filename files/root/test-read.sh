#!/bin/sh

while true; do
    if=/tmp/read-$(printf %03d $(expr $RANDOM % 100))
    of=/dev/null
    dd if=$if of=$of count=4096
done
