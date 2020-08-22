#!/usr/bin/perl -w

$number = 10;
if (@ARGV > 0 && $ARGV[0] =~ /-\d{1,}/){
	$number = $ARGV[0];
	chmod $number;
	$number =~ s/-//g;
	shift @ARGV;
} 
if (@ARGV > 0){
	foreach $file (@ARGV) {
    		open IN, '<', $file or die "$0: can't open $file\n";
		@lines = <IN>;
    		close IN;
		
		while (@lines > $number) {
			shift @lines;		
		}
		
		if (@ARGV > 1) {
			print "==> $file <==\n";	
		}
		
		foreach $line (@lines) {
			print "$line";		
		}
	}
}else {
	@lines = <STDIN>;
	while (@lines > $number) {
		shift @lines;		
	}
	foreach $line (@lines) {
		print "$line";		
	}
}