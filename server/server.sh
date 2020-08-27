#!/bin/bash
set -eu

if [ -e "./stream" ]; then
    rm stream
fi

port="80"
if [ $# -gt 0 ]; then
    port=$1
fi

trap exit INT
mkfifo stream
while true; do
    nc -l ${port} -w 1 < stream | awk '/HTTP/ {system("./get_content.sh " $2)}' > stream
done