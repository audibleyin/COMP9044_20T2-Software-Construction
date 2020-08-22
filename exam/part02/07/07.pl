#!/usr/bin/perl -w

while ($line = <STDIN>){
    print "$line\n" if $line eq "hello";
    print "$line\n" if $line eq "42";
}