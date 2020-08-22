#!/bin/sh

for pattern in "$@"
do
    IFS=$'\n'
    for file in $(find "$pattern" -type f|sort); 
    do
       dir_path=$(dirname "$file")
       dir_name=$(basename "$dir_path")
       file_name=$(basename "$file" .mp3)
       title=$(echo "$file_name" |sed 's/ - /|/g' | cut -d'|' -f2| sed -e 's/^\s*//' -e 's/\s*$//')
       artist=$(echo "$file_name" | sed 's/ - /|/g' | cut -d'|' -f3 | sed -e 's/^\s*//' -e 's/\s*$//')
       track=$(echo "$file_name" |sed 's/ - /|/g'| cut -d'|' -f1)
       year=$(echo "$dir_name" | cut -d',' -f2| sed -e 's/^\s*//' -e 's/\s*$//')
       
       id3 -t "$title" -T "$track" -a "$artist" -A "$dir_name" -y "$year" "$file" >> /dev/null
    done
    unset IFS
done