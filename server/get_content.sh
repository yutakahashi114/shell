#!/bin/bash
set -eu

FILE_NAME=$1
STATIC_DIR=./static

if [ -f "$STATIC_DIR$FILE_NAME" ]; then
    cat <<EOS
HTTP/1.0 200 OK
Content-Type: text/html

EOS
    cat "$STATIC_DIR$FILE_NAME"
else
    cat <<EOS
HTTP/1.0 404 Not Found
Content-Type: text/html
EOS
fi