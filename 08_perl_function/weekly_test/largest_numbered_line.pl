#!/usr/bin/perl -w

use List::Util qw(max);

my @lines = ();
my @numbers = ();

while (my $line = <>) {
	my @matches = $line =~ /(-?\d*\.?\d+)/g;
	if (@matches > 0) {
		my $max_value = max(@matches);
		push @lines,$line;
		push @numbers, $max_value;
	}
}

my $max_value = max(@numbers);
for (my $index = 0; $index < @numbers; $index++) {
		if ($numbers[$index] == $max_value){
			print "$lines[$index]";
		}
}
