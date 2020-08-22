#!/usr/bin/perl -w

sub get_artist_file_words {
	my %artist_words  = ();
	foreach $file (glob "lyrics/*.txt") {
        	$file =~ /\/(.*)\.txt/;
        	$artist_name = $1;
		$artist_name =~ s/_/ /;
        	open my $in, '<',$file;
        	while ( $line =<$in>) {
                	chomp $line;
			$line = lc($line);
                	@words = split /[^a-z]/,$line;
                	foreach $word (@words) { 
                        	next if $word eq "";
                        	$artist_words{$artist_name}{$word}++;
                	}
        	}
        	close $in;
	}
	# artist words;
	return %artist_words; 
}

sub get_txt_file_words {
	my ($file) = @_;
	my %txt_words=();  
        open my $in, '<', $file;
        while ( my $line = <$in>) {
                chomp $line;
                $line = lc($line);
                @words = split /[^a-z]/,$line;
                foreach $word (@words) {
                        chomp $word;
                        next if $word eq "";
			$txt_words{lc($word)} ++ ;
                }
        }

	return %txt_words;
	
}

if ( $ARGV[0] eq "-d" ) {
	$file = $ARGV[1];
	my %txt_words = get_txt_file_words $file;
	
	my %artist_words = get_artist_file_words;

	my @txt_keys = keys %txt_words;
	my @artist = sort keys %artist_words;	
	
	my %artist_hash = ();
	foreach $name (@artist) {
		my $total = 0;
		foreach $count (values %{$artist_words{$name}}){
			$total +=$count;
		}
		
		my $result = 0;
		foreach $key_word (@txt_keys) {
			my $count = 0;
			if (exists $artist_words{$name}{$key_word}) {
				$count = $artist_words{$name}{$key_word};	
			}
			$result += log(($count + 1)/$total) * $txt_words{$key_word};
		}
		$name =~ s/_/ /g;
		$artist_hash{$name} = $result;
	}

	foreach my $name (sort {$artist_hash{$b} <=> $artist_hash{$a} } keys %artist_hash ){
		printf "%s: log_probability of %.1f for %s\n", $file, $artist_hash{$name},$name;  
	}
	 foreach my $name (sort {$artist_hash{$b} <=> $artist_hash{$a} } keys %artist_hash ){
                printf "%s most resembles the work of %s (log-probability=%.1f)\n", $file,$name, $artist_hash{$name};
		last;
        }

} else {

	my %artist_words = get_artist_file_words;
	my @artist = sort keys %artist_words;
	my %artist_word_count = ();
	foreach $name (@artist) {
		my $total = 0;
        	foreach $count (values %{$artist_words{$name}}){
                         $total +=$count;
        	}
		$artist_word_count{$name} = $total;
	}

	foreach $file (@ARGV) {
		$file =~ /(.*)\.txt/;
		#$file_name = $1;
		
		my %txt_words = get_txt_file_words $file;
		my @txt_keys = keys %txt_words;	
		my %artist_hash = ();
        	foreach $name (@artist) {
                	my $total = $artist_word_count{$name};
			#next if $total == 0;
                	my $result = 0;
                	foreach $key_word (@txt_keys) {
                        	my $count = 0;
                        	if (exists $artist_words{$name}{$key_word}) {
                                	$count = $artist_words{$name}{$key_word};                               
                        	
				}
				
                        	$result += log(($count + 1)/$total) * $txt_words{$key_word};
                	}
                	$artist_hash{$name} = $result;
        	}

         	foreach my $name (sort {$artist_hash{$b} <=> $artist_hash{$a} } keys %artist_hash ){
            		 
			printf "%s most resembles the work of %s (log-probability=%.1f)\n", $file,$name, $artist_hash{$name};
                	last;
        	}

	}
}
