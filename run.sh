#!/bin/sh

image='crorvick/io-test'
tests='read write read-write'
max_containers=8
duration=30
csv="out/io-test_$HOSTNAME.csv"

[ -d out ] || mkdir out

rm -f "$csv"

for test in $tests; do

    for n in $(seq 1 "$max_containers"); do
        name="io-test-$test-$n"
        docker run -d --name "$name" "$image" read
        sleep "$duration"
        docker logs "$name" 2>"out/$name.log"
    done

    for n in $(seq 1 "$max_containers"); do
        name="io-test-$test-$n"
        docker rm -f "$name"
	sed -n "s/.* copied, \([.0-9]*\) s.*/$n,\1/p" "out/$name.log" >>"$csv"
    done

done
