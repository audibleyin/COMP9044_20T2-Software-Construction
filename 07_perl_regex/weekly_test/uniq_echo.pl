#!/usr/bin/perl -w
use experimental 'smartmatch';

@result = ();

foreach $arg (@ARGV) {
    next if ($arg ~~ @result);
    push @result, $arg;
}

print join " ", @result;
print "\n"