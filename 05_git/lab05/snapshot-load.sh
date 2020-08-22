#!/bin/dash

# back up current dictionary
snapshot-save.sh
# loop files
for file_name in .snapshot.$1/*
do
	dest_name=$(basename $file_name)
	cat "$file_name" > "$dest_name"
done
echo "Restoring snapshot $1"


