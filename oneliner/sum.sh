#!/bin/bash
set -eu

awk 'NR>1 {s += $5} END {print s}' tmp