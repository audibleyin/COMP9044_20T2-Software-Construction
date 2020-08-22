#!/usr/bin/perl -w

$start=$ARGV[0];
$end=$ARGV[1];
open my $out, '>', $ARGV[2];
while ($start <= $end) {
	print $out "$start\n";
	$start +=1;
}
close $out;