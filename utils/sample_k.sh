#!/bin/bash

if [ $# != "2" ]; then
    echo "$0 <source_folder> <k> <target_folder>"
    return 1
fi

source_folder=$1
k=$2
target_folder=$3

mkdir -p $target_folder
for file in $(ls $source_folder | shuf | head -n $k);
do
    cp $source_folder/$file $target_folder
done
