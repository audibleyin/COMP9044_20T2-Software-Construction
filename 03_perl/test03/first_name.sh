#!/bin/sh
cat "$1"|
egrep 'COMP[29]041' |
cut -d'|' -f3 |
cut -d',' -f2|
cut -d' ' -f2|
sort |
uniq -c|
sort -rn|
head -1|
egrep -i -o '[a-z]+'