#!/usr/bin/perl -w

use experimental 'smartmatch';

@result = ();

while (@ARGV) {
    $word = shift @ARGV;
    next if ($word ~~ @result);
    push @result,$word;
}

print join(" ", @result),"\n";