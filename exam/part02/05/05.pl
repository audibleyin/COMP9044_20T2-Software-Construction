#!/usr/bin/perl -w

while ($line = <STDIN>) {
    if ($line =~ /[^#]([0-9]+)/){
        print "$1\n";
    }
}