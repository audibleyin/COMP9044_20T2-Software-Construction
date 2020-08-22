#!/usr/bin/perl -w
$number = 0;

while (1) {
	$filename = ".$ARGV[0].$number";
	if ( ! -e $filename) {
		open my $in, '<', $ARGV[0];
		@contents = (<$in>);
		close $in;

		open my $out, '>', $filename;
		print $out @contents;
		close $out;
		print "Backup of '$ARGV[0]' saved as '$filename'\n";
		exit 0;
	}
	
	$number ++;
}
