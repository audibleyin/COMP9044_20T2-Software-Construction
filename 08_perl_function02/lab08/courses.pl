#!/usr/bin/perl -w

use LWP::Simple;
use experimental 'smartmatch';

$url = "http://www.timetable.unsw.edu.au/current/COMPKENS.html";
$course = shift @ARGV;
$url =~ s/COMP/$course/g;
$web_page = get($url) or die "Unable to get $url";

@lines = split(/\n/, $web_page);

@results = ();
foreach $line (@lines){
    if ($line =~ /$course/){
        if ($line =~ /$course.*html\">$course.*<\/a>/){
            next;
        }
        
        $line =~ s/\.html\">/ /g;
        $line =~ s/<\/a><\/td>//g;
        $line =~ s/.*\"//g;
        next if ($line ~~ @results);
        push @results,$line;
    }
}

print join("\n",sort @results),"\n";