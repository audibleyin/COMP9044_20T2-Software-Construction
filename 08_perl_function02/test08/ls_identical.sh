#!/bin/bash

dir1=$1
dir2=$2

for ls_file1 in $dir1/*
do
    file_name=`basename "$ls_file1"`
    if test -e "$dir2/$file_name"
    then
        if diff -i -w "$dir1/$file_name" "$dir2/$file_name" >/dev/null
        then
            echo "$file_name"
        fi
    fi
done

