#!/bin/sh

dir_name=$1
shift
current_path=`pwd`
for file in `find $dir_name`
do
    makefile=`basename $file`
    if test $makefile = "Makefile"
    then
        dir=`dirname $file`
        echo "Running make in $dir"
        cd "$current_path/$dir"
        make $1
        # make -f $file
        # echo "$dir $makefile"
    fi
    
done