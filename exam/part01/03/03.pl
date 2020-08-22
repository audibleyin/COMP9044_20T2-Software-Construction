#!/usr/bin/perl -w
@n = (2,4,8);
$a = @n;
$b = $#n;
$c = $n[$b];
print '$b';
print "$a $c @n\n";