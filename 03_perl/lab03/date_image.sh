#!/bin/sh

for file in "$@"
do 
    temp_file="$file.temp"
    file_time=$(ls -l "$file" | cut -d' ' -f6-8)
    convert -gravity south -pointsize 36 -draw "text 0,10 '$file_time'" "$file" "$temp_file"
    mv "$temp_file" "$file"
done