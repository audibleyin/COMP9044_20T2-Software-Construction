#!/bin/bash

curl --location --silent "http://www.timetable.unsw.edu.au/current/$1KENS.html"|egrep "$1" |grep -v "$1.*html\">$1.*<\/a>"|egrep -o "$1.*html\">.*<\/a>"|sed "s/\.html\">/ /g;s/<\/a>//g;" |sort |uniq
