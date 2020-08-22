#!/bin/sh

small_file_content='Small files:'
media_file_content='Medium-sized files:'
large_file_content='Large files:'
for filename in `ls`
do
    number_of_lines=`cat $filename|wc -l`
    if (($number_of_lines < 10))
    then
        small_file_content="$small_file_content $filename"
    elif (($number_of_lines < 100))
    then
        media_file_content="$media_file_content $filename"
    else
        large_file_content="$large_file_content $filename"
    fi
done

echo $small_file_content
echo $media_file_content
echo $large_file_content