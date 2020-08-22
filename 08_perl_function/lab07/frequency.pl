#!/usr/bin/perl -w

$input = lc($ARGV[0]);
foreach $file (glob "lyrics/*.txt") {
	$total = 0;
	$count = 0;
	open my $in, '<', $file;
	while ($line = <$in>){
		chomp $line;
		$line = lc($line);
		@words = split /[^a-zA-Z]/,$line;
		foreach $word (@words) {
			if ($word ne "") {
				$count++ if $word eq $input;
				$total++;
			}		
		}	
	}
	close $in;
	$rate = $count/$total;
	$file =~ s/lyrics\///g;
	$file =~ s/\.txt//g;
	$file =~ s/_//g;
	printf "%4d/%6d = %.9f %s\n",$count, $total,$rate,$file;
	
}



