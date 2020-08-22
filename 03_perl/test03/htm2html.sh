#!/bin/sh

for file in *.htm
do
	html_file=$(echo "$file"|sed 's/htm/html/g')
	if test -e "$html_file"
	then
		echo "$html_file exists"
		exit 1
	else
		mv "$file" "$html_file"	
	fi
done