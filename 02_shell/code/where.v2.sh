#!/bin/sh
# Print all occurances of executable programs with the specified names in $PATH
# written by geoffw@cse.unsw.edu.au as a COMP2041 example
# Note use of tr to produce a list of directories one per line
# suitable for a while loop.
# Won't work if directories contain new-lines (fixing this left as an exercise)

if test $# = 0
then
    echo "Usage $0: <program>" 1>&2
    exit 1
fi
for program in "$@"
do
    n_path_components=`echo $PATH|tr -d -c :|wc -c`
    index=1
    while test $index -le $n_path_components
    do
        directory=`echo "$PATH"|cut -d: -f$index`
        f="$directory/$program"
        if test -x "$f"
        then
            ls -ld "$f"
            program_found=1
        fi
        index=`expr $index + 1`
    done
    test -n $program_found || echo "$program not found"
done
