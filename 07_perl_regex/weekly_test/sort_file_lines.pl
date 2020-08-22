#!/usr/bin/perl -w

$file = shift @ARGV;

open my $in , "<" ,"$file" or die "can not open!\n";
@lines=<$in>;
close $in;

# the func to compare the length $a and $b is the 
# formal parameter that assign by the vlaue in the array
sub compare_line {
	return length $a <=> length $b || $a <=> $b;
}
@sorted_lines = sort compare_line @lines;

print @sorted_lines;

