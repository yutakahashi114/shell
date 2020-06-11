#!/bin/bash
set -eu
cd $(dirname $0)

DIR=${1:-"./"}


function test() {
    while read TARGET_DIR
    do
        rm -r ${TARGET_DIR}
    done < <(find $1 -type d -empty)

    if [ -n $(find $1 -type d -empty) ]; then
        test $1
    fi
}

test ${DIR}