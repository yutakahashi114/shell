#!/bin/bash

set -eu

function get_dir_name() {
    local work_dir=$(pwd)

    local target_dir=$(cd $(dirname $0); pwd)

    if [ -n "$1" ]; then
        target_dir="$work_dir/$1"
    fi

    echo $target_dir
}


if [ $# -gt 1 ]; then
    echo "error: invalid args"
    exit 1
fi

arg=""
if [ $# -eq 1 ]; then
    arg=$1
fi

target_dir=`get_dir_name "$arg"`
output_file="deletelist.txt"
: > $output_file
for filepath in `find $target_dir -type d -empty`; do
    echo $filepath >> $output_file
    rm -rf $filepath
done
