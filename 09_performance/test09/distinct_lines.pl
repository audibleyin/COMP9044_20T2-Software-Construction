#!/usr/bin/perl -w

$number = shift @ARGV;

# scalar(keys %lines); 获取字典的长度

# lc
# $line =~ s/^\s*//g;
# $line =~ s/\s*$//g;
# 换行： chomp


%lines = ();
$total = 0;
while ($line = <>) {
    chomp $line;
    $line =~ s/\s*//g;
    $lines{lc($line)}++;
    $distinct_count = 0;
    print scalar(keys %lines);
    foreach $key (keys %lines) {
        $distinct_count++;
    }
    $total++;
    if ($distinct_count == $number){
        print "$number distinct lines seen after $total lines read.\n";
        exit 1;
    }
}

$distinct_count = 0;
foreach $key (keys %lines) {
    if ($lines{$key} == 1) {
        $distinct_count++;
    }
}
print "End of input reached after $total lines read - $number different lines not seen.\n"
