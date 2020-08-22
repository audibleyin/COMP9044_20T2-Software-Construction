#!/usr/bin/perl -w

while ($line = <>) {
    while ($line =~ /(\d+\.\d+)/){
        my $value = int($1+ 0.5);
        $line =~ s/(\d+\.\d+)/$value/
    }
    print "$line";
}

