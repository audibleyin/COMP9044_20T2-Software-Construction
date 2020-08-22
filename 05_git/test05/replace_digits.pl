#!/usr/bin/perl -w
open my $in, '<',$ARGV[0];
@lines = <$in>;
close $in;

open my $out, '>',$ARGV[0];
for $line (@lines) {
	$line =~ s/\d/#/g;
	print $out  $line;
}
close $out;

