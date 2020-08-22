#!/bin/sh
cat $1|egrep "name"| sed "s/[{}\"]//g"|cut -d',' -f1|cut -d':' -f2|sed "s/^\s*//g" |sed "s/\s*$//g" |sort|uniq