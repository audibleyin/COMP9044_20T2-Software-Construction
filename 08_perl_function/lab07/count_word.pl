#!/usr/bin/perl -w

$count = 0;
$word = lc($ARGV[0]);
while ($line = <STDIN>) {
	@words = split /\b$word\b/,lc($line);
	$count +=$#words;
}
print "$word occurred $count times\n";
