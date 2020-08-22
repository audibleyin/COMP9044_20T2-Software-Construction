# perl的表达式对应简单的学习网站
    http://jkorpela.fi/perl/regexp.html


# 表达式的用法总结

    $line =~ /([^ ]+) (.+)/ or die "$0: bad line format '$line'";
    $course =~ s/\|.*//;

    @fields = split /\|/, $line;
    

# 数组的用法
    print join(" ", @ARGV), "\n";


    $sum = 0;
    foreach $arg (@ARGV) {
        $sum += $arg;
    }

    # 某一个元素赋值
    $a[$n] = 42;

    
    sort @a
    reverse @a
    shift @a
    unshift @a,x

    split /[#@]+/, ’ab##@#c#d@@e’


    # 空的字典
    %a = ()

    # the last number (real or integer)
    /(-?\d+(\.\d+)?)\D*$/

    sub compare_line {
	    return length $a <=> length $b || $a <=> $b;
    }
    @sorted_lines = sort compare_line @lines;


