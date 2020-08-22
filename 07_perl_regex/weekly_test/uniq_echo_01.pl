#!/usr/bin/perl -w

@result = ();
foreach $arg (@ARGV) {
    next if $hash_result{$arg};
    $hash_result{$arg} = 1;
    push @result, $arg;
}

print join " ", @result;
print "\n"