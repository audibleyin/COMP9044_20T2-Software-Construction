#!/bin/dash
number=0
while true 
do
	dir_name=".snapshot.$number"
	if ! [ -d "$dir_name" ]
	then
		mkdir "$dir_name"
		for file_name in *.*
		do
			if [ $file_name != "snapshot-load.sh" ] && [ $file_name != "snapshot-save.sh" ]
			then
				cp "$file_name" "$dir_name/$file_name"
			fi
		done
		echo "Creating snapshot $number"
		exit 0
	fi
	
	number=`expr $number + 1`
done
