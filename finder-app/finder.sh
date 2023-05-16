#!/bin/sh

filesdir=$1
searchstr=$2

# if any of the two arguments is missing, output error
if [ $# -lt 2 ]
then
    echo "Must specify <file path> and <search string>"
    exit 1
# if the directory doesn't exist, output error
elif [ -e "filesdir" ]
then
    echo "file directory does not exist"
    exit 1
else
    num_file=$(ls -1 $filesdir | wc -l | awk '{print $1}')
    output=$(grep -r $searchstr $filesdir | wc -l | awk '{print $1}')
    echo "The number of files are $num_file and the number of matching lines are $output."
fi
