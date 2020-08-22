# perl 测试文件是否存在（类似于sh的test）
    if (! -r "myFile") {
        die "Can’t read myFile: $!\n";
    }
    # or
    die "Can’t read myFile: $!\n" if ! -r "myFile"; # or
    -r "myFile" or die "Can’t read myFile: $!\n"
 
# 字典的使用方式
    # 字典嵌套字典，获取字典中的字典
    # dict_dict
    foreach $c_file (keys %dict_dict){
        foreach $h_file (keys %{$dict_dict{$c_file}}) {
                print " $h_file.h";
            }
    }
    