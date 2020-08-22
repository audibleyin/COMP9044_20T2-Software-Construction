#!/usr/bin/perl -w

$count = 0;
while ( $line = <STDIN> ) {
	@words = split /[^a-zA-Z]/,$line;
	foreach $word (@words){
		chomp $word;
		if ( $word ne ""){
			$count++;		
		}	
	}
}
print "$count words\n"
