#!/usr/bin/perl -w

$arg = shift @ARGV;
while(<>){
	chomp;
	$dic{$_}++;
	foreach $w (keys %dic ){
		if ( $dic{$w} == $arg ){
			print "Snap: $w\n";
			exit 0;
		}
	}
}