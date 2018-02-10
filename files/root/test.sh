#!/bin/sh

test="$(dirname $0)/test-$1.sh"

[ -x "$test" ] && exec "$test"

echo "ERROR: test not found: $test" >&2
