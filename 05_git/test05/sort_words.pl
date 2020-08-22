#!/usr/bin/perl -w

while ($line = <>) {
    	chomp $line;
    	my @words = split / /, $line;
    	my @new_words = sort @words;
    	$line = join " ", @new_words;
	print "$line\n"
}
