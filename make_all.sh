#!/bin/sh

for dir in Assert-Refute-T-*; do
    test -f "$dir/Makefile.PL" || continue
    cd "$dir"
    perl Makefile.PL || exit 1
    for action in "$@"; do
        make "$action" || exit 1
    done
    cd ..
done
