#!/usr/bin/perl -w
if (@ARGV < 2) {
	print "Usage: $0 <files>\n";
	exit 1;
}

@lines = ();
foreach $file_name (@ARGV){
    open F, '<', "$file_name" or die "$file_name does not exist";
    @new_lines = <F>;
    close F;
    if (@lines){
        $i = 0;
        if ($#new_lines != $#lines ){
            print "$file_name is not identical\n";
            exit 1;
        }
        while ($i < @lines){
            if ($lines[$i] ne $new_lines[$i]){
                print "$file_name is not identical\n";
                exit 1;
            }
            $i++;
        }
    }
    @lines = @new_lines;
}
print "All files are identical\n";
