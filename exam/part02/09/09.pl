#!/usr/bin/perl -w

$line = "Nov 8 2017";
while($line =~ s/([^a-z]+)//){
    $i++;
    print "$i $1\n";
}