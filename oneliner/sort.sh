#!/bin/bash
set -eu

head -n 1 tmp && tail -n +2 tmp | sort -n -k 6