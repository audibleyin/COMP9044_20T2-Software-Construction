#!/usr/bin/perl -w

sub save_opt {
	$number = 0;
        while ( -d ".snapshot.$number") {
                $number++;
        }

        mkdir ".snapshot.$number";
        my @files = glob("*");
        foreach my $file (@files) {
                next if ($file =~ m/^\./);
                next if ($file =~ m/^snapshot\.pl$/);

                open my $in, '<', $file;
                open my $out, '>', ".snapshot.$number/$file";

                while ($line = <$in>) {
                        print $out $line;
                }

                close $in;
                close $out;

        }
        print "Creating snapshot $number\n";
}

if ($ARGV[0] eq "save") {
	save_opt();
} 

if ($ARGV[0] eq "load") {
	save_opt();
	
	my @files = glob("\.snapshot\.$ARGV[1]/*");
        foreach my $file (@files) {
		
		$file =~ s/.*\///g;
		#print "$file\n";
                open my $in, '<', ".snapshot.$ARGV[1]/$file" or die "$0: Can't open .snapshot.$number $file: $!\n";
                open my $out, '>', "$file" or die "$0: Can't open $file: $!\n";

                while ($line = <$in>) {
                        print $out $line;
                }

                close $in;
                close $out;
	}
	print "Restoring snapshot $ARGV[1]\n";
	
}
