#!/usr/bin/perl -w

@words = ();
for $word (@ARGV){
	push @words,$word if lc($word) =~ /[aeiou]{3}/;
}

print join(" ", @words);
print "\n";
