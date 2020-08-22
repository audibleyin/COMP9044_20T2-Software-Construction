#!/usr/bin/perl -w

if (@ARGV){
    @numbers = sort {$a <=> $b} @ARGV;
    print $numbers[($#numbers + 1)/2],"\n";
}