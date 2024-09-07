#!/bin/bash

if [ $# != "1" ]; then
    echo "$0 <file_path>"
    return 1
fi

file_path=$1
cleaned_path=$(echo "$file_path" | sed 's/\/\{2,\}/\//g')
cleaned_path="${cleaned_path%/}"  # remove trailing /

echo $cleaned_path
