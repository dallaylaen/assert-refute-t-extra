#!/bin/sh

# This script is a poor man's recursive make
# It descends into every directory with a Makefile.PL in it
# and executes `perl Makefile.PL` 
# followed by `make <target>` for each of its arguments

# E.g. `make_all.sh test` will execute make test in all directories

# This is a horrible kludge after all.
# Maybe all these directories should be just separate repos...

for dir in Assert-Refute-T-*; do
    test -f "$dir/Makefile.PL" || continue
    cd "$dir" || exit 1
    perl Makefile.PL || exit 1
    for action in "$@"; do
        make "$action" || exit 1
        if [ "$action" = test ]; then
            # make cannot utilize xt, so do it manually...
            prove -Ilib xt || exit 1
        fi
    done
    cd .. || exit 1
done
