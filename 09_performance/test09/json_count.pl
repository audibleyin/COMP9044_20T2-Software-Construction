#!/usr/bin/perl -w
$key = shift @ARGV;
$file = shift @ARGV;

open my $in, '<', $file or die "Cannot open $file: $!";
@lines = <$in>;
close $in;

$total = 0;
while (@lines) {
    my $count = 0;
    # 此处是取一组

    while (@lines){
        $line = shift @lines;
        if ($line =~ /\s*\"how_many\":\s*(\d+),/){
            $count = $count + $1;
        }
        if ($line =~ /\s*\"species\":\s*\"(.*)\"/){
            if ($key eq $1){
                $total = $total + $count;
            }
            last;
        }
    }
}

print "$total\n";