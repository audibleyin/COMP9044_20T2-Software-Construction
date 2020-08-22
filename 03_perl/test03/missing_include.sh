#!/bin/sh
for file in "$@"
do
	for line in $(cat "$file"|egrep -i -o "\"[a-z]+\.h\""|sed 's/\"//g')
	do
		if test -e "$line"
    		then
			continue
		else
			echo "$line included into $file does not exist"
		fi
	done
done