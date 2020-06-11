#!/bin/bash
set -eu

file_name="${1:-"$(cd $(dirname $0); pwd)/test.log"}"

err="error"

if [ ! -f $file_name ]; then
    echo "error: file not found"
    exit 1
fi

while read line
do
    if [ -n "`echo $line | grep $err`" ];then
        echo "error occurred: $line"
    fi
done < <(tail -1 -F $file_name)
