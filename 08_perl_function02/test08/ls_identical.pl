#!/usr/bin/perl -w

use File::Compare;

$dir1 = $ARGV[0];
$dir2 = $ARGV[1];
foreach $file1 (glob("$dir1/*")){
    $file2 = $file1;
    $file2 =~ s/.*\///g;
	if (compare("$file1","$dir2/$file2") == 0) {
	    print "$file2\n";
	}
}