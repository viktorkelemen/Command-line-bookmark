#!/bin/sh
#/ Usage: cb.sh <shortcut>
set -e

test $# -eq 0 -o "$1" = "--help" && {
    grep '^#/' <"$0" |
    cut -c4-
    exit 2
}

shortcut=$1

line=`awk -F "," '{ if ($1 == "'$shortcut'") print $2,",",$3; }' ~/clibookmark.commands`

cmd=`echo $line | awk -F "," '{ print $1 }'`
path=`echo $line | awk -F "," '{ print $2 }'`

if [ -z "$path" ] || [ $path == `pwd` ]
then
    $cmd
else
    echo "No command with this path."
fi