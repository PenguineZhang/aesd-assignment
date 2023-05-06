#!/bin/bash

writefile=$1
writestr=$2

if [ $# -lt 2 ]
then
    echo "Must specify <write file path> and <write string>"
    exit 1
else
    if ! [ -e "$writefile" ]
    then
        mkdir -p $(dirname "$writefile")
    fi
    
    touch "$writefile"
    echo "$writestr" > "$writefile"
fi
