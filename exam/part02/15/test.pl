#!/usr/bin/perl -w

$number = "";
if (! $number eq "") {
    print "not eq\n";
} else {
    print "eq\n"
}

$number = "abc";

@numbers = split(//,$number);

shift @numbers;

print "@numbers";
