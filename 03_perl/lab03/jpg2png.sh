#!/bin/sh
for file in *.jpg
do 
    png=$(echo "$file"|sed 's/jpg/png/g')
    if test -e "$png"
    then
    	echo "$png already exists"
	continue
    fi
    convert "$file" "$png"
    rm "$file"
done