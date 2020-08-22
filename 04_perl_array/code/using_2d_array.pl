#!/usr/bin/perl -w

@a = ();

# assign reference to array to $a[42]
$a[42] = [1,2,3];

print "$a[42]\n";      # print ARRAY(0x5576c45e8160)
print "@{$a[42]}\n";   # prints 1 2 3

push @{$a[42]}, (4,5,6);
push @{$a[42]}, (7,8,9);

print "$a[42]\n";      # print ARRAY(0x5576c45e8160)
print "@{$a[42]}\n";   # prints 1 2 3 4 5 6 7 8 9/tmp/a.pl
