#!/usr/bin/perl -w

@ARGV == 2 or die "Usage: $0 <number of lines> <string>\n";
$ARGV[0] =~ /\d/ or die "$0: argument 1 must be a non-negative integer\n";
$ARGV[0] >=0 or die "$0: argument 1 must be a non-negative integer\n";
$number = 0;
while ($number < $ARGV[0]){
	printf "%s\n",$ARGV[1];
	$number ++;
}