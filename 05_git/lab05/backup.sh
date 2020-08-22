#!/bin/sh

number=0
while true 
do
        filename=".$1.$number"
	if ! [ -e "$filename" ]
	then
		cp "$1" "$filename"
		echo "Backup of '$1' saved as '$filename'"
		exit 0
	fi
	number=`expr $number + 1`
done
