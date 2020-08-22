#!/usr/bin/perl -w

@lines=<STDIN>;

@indexes = ();

while (@indexes < @lines) {
	$index = int(rand(@lines + 1));
	if (grep {$_ eq $index} @indexes){
		next;	
	}else{
		push (@indexes, $index);	
	}
}

foreach $index (@indexes) {
	print "$lines[$index]"
}