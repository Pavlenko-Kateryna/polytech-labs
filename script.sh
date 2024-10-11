#!/bin/bash
target="/etc"
count=$(find "$target" -type f | wc -l)
echo "The number of regular files in $target: $count"
