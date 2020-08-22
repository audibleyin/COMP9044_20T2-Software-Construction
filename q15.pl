#!/usr/bin/perl -w

sub check_numbers {

    my ($last_word, $number, @current_words) = @_;
    if (! $number eq ""){
        my @numbers = split(//, $number);
        my $current_number = shift @numbers;
        my $current_letter = $words_numbers{$current_number};
        my @current_letters = split(//, $current_letter);

        while (@current_letters){
            my $letter = shift @current_letters;
            my $current_word = $last_word;
            $current_word .=$letter;

            # 一种是继续走
            check_numbers($current_word, join("",@numbers), @current_words);

            if (exists $words{$current_word}) {
                # 重新复制一份
                my @new_current_words = ();
                foreach $new_word (@current_words) {
                    push @new_current_words, $new_word;
                }
                push @new_current_words,$current_word;
                # 一种是把当前的压栈
                check_numbers("", join("",@numbers), @new_current_words);
            }
        }
    }else {
        if (@current_words){
            if ($last_word eq "") {
                push @result, join(" ", @current_words);
            }
        }
    }

}


$file_name = shift @ARGV;
$param_number = shift @ARGV;

%words = ();

%words_numbers = ();
$words_numbers{"2"} = "abc";
$words_numbers{"3"} = "def";
$words_numbers{"4"} = "ghi";
$words_numbers{"5"} = "jkl";
$words_numbers{"6"} = "mno";
$words_numbers{"7"} = "pqrs";
$words_numbers{"8"} = "tuv";
$words_numbers{"9"} = "wxyz";

@result = ();

open my $file, '<', "$file_name"; 
while ($line = <$file>) {
    $line =~ s/\s*$//;
    $line = lc($line);
    $words{$line} = 1;
}
close $file;

@start_words = ();

check_numbers("",$param_number,@start_words);

foreach my $word (@result) {
    print "$word\n";
}