#!/bin/bash

if [ -n "$1" ] && [ -d "$1" ]; then
    echo "Change to $1"
    cd $1 || exit
fi

prefix="dot-"
for file in ${prefix}*; do
    in_place="${file/${prefix}/${HOME}\/.}"
    echo ">>>>> ${in_place} >>>>> ${file}"
    diff -rq ${in_place} ${file} && echo "No diff"
    printf "\n"
done
