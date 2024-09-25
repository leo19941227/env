#!/bin/bash

if [ $# != "3" ]; then
    echo "$0 <source_folder> <target_folder> <k>"
    return 1
fi

source_folder=$1
target_folder=$2
k=$3

mkdir -p $target_folder
for file in $(ls $source_folder | shuf | head -n $k);
do
    ln -s $(realpath $source_folder/$file) $target_folder/$file
done
