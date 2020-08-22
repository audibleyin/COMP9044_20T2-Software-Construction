#!/usr/bin/perl -w
open $in,"<",$ARGV[0];
@lines = <$in>;
close $in;

if (@lines > 0) {
	$a = ($#lines + 1) % 2;
	$b = ($#lines + 1) / 2;
	if ($a == 1){
		print "$lines[$b]";
	}else {
		print $lines[$b-1];
		print $lines[$b];
	}
}
