#!/bin/sh

if test -e $3
then 
	rm -rf $3;
fi

temp=$1
while test $temp -le $2 
do
	echo "$temp" >> $3;
	temp=`expr $temp + 1`;
done