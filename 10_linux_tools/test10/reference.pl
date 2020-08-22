#!/usr/bin/perl -w

@lines = (<>);

$index = 0;
foreach $line (@lines) {
    if ($line =~ /^\#(\d+)/){
        $line_number = $1 - 1;
        if ($line_number < @lines){
            $lines[$index] = $lines[$line_number];
        }
    }
    $index++;
}
print @lines;
