#!/bin/sh
if (($# != 2))
then
     echo "Usage: $0 <number of lines> <string>"
     exit 1
else
   if echo "$1" | egrep -v "^[[0-9]|[1-9][0-9]+]$" >/dev/null
   then
        echo "$0: argument 1 must be a non-negative integer"
        exit 1
   fi
fi

number=0
while test $number -lt $1
do
    echo $2
    number=`expr $number + 1` # or number=$((number+1))
done