#!/bin/sh
tr -c a-zA-Z ' '|
tr ' ' '\n'|
tr A-Z a-z|
egrep -v '^$'|
sort|
uniq -c

