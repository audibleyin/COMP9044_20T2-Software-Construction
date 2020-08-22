#!/bin/sh

for file in "$@"
do
        filename=$(echo "$file"|cut -d'.' -f1)
	read -p "Adress to e-mail this image to? " email_address 
	read -p "Message to accompany image? " email_content
        echo "$email_content"|mutt -s "$filename" -e 'set copy=no' -a "$file" -- "$email_address" 
	echo "$file sent to $email_address"
done