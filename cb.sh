#!/bin/sh
#/ Usage: cb.sh <shortcut>
set -e

test $# -eq 0 -o "$1" = "--help" && {
    grep '^#/' <"$0" |
    cut -c4-
    exit 2
}

shortcut=$1

cmd=`awk -F "," '{ if ($1 == "'$shortcut'" && system($3) == 0) print $2; }' ~/clibookmark.commands`

if [ -z "$cmd" ]
then
    echo "No command with this path."
else
    $cmd $2 $3 $4
fi