#!/bin/sh

# pipelines
for url in "$@"
do
    server=`curl -sI $url |grep -i 'server:' | cut -d ':' -f2`
    echo "$url$server"
done
