#!/bin/sh
for file in "$@"
do
    file_size=`ls -l $file|cut -d' ' -f5`
    xz -fqk $file
    file_size_1=`ls -l "$file.xz"|cut -d' ' -f5`
    # echo "$file_size $file_size_1"
    if test $file_size -le $file_size_1
    then
        echo "$file $file_size bytes, compresses to $file_size_1 bytes, left uncompressed"
        rm "$file.xz"
    else
        echo "$file $file_size bytes, compresses to $file_size_1 bytes, compressed"
        rm "$file"
    fi
done