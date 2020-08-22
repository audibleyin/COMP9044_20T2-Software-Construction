#!/usr/bin/perl -w

open my $in, '<',$ARGV[1];
@lines = <$in>;
close $in;

if (@lines >= $ARGV[0]) {
	print $lines[$ARGV[0]-1];
}