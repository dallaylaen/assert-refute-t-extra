#!/bin/sh

NAME=$1

die() {
    echo >&2 "$@"
    exit 1
}

if [ -z "$NAME" ]; then
    die "Usage: $0 <module_name>"
fi

DIR="Assert-Refute-T-$NAME"

mkdir "$DIR" || die "Failed to create $DIR"

cp -rp __skeleton__/. "$DIR" || die "Failed to copy __skeleton__";

cd "$DIR" || die "Failed to chdir" 

MASS_RENAME='s#Assert\([^a-z ]*\)Refute\1T\1[A-Z][A-Za-z_]*#Assert\1Refute\1T\1'"$NAME"'#g'

mv "lib/Assert/Refute/T"/*.pm "lib/Assert/Refute/T/$NAME.pm"\
    || die "Failed to rename module";

find "." -type f | xargs sed -i "$MASS_RENAME" || die "Failed to edit files"

perl Makefile.PL && make && make test || die "Self-check failed"

echo "$DIR created"
