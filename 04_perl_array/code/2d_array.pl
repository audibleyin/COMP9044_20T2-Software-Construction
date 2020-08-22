#!/usr/bin/perl -w


# Perl provides only 1 dimensional arrays
# but arrays  elements can contain references to other arrays

foreach $i (0..3) {
   foreach $j (0..3) {
        $a[$i][$j] = $i * $j;
    }
}

# We can index @a as if it is a 2d-array
# The following loop prints
#  0  0  0  0
#  0  1  2  3
#  0  2  4  6
#  0  3  6  9

foreach $i (0..3) {
    foreach $j (0..3) {
        printf "%2d ", $a[$i][$j];
    }
    print "\n";
}

# @a contains references to 4 arrays
# the following loop will print something like
# ARRAY(0x55ab77d5e120)
# ARRAY(0x55ab77d5e2a0)
# ARRAY(0x55ab77d687c8)
# ARRAY(0x55ab77d68858)

foreach $i (0..3) {
    print "$a[$i]\n";
}

# We can access the whole array referenced by $a[2] as @{$a[2]}
# the following statement prints
# 0 2 4 6

print "@{$a[2]}\n";
