#!/usr/bin/perl -w

while ($line =<STDIN>) {
    $line =~ s/[aeiou]//g;
    print $line;
}

#[square brackets rock]