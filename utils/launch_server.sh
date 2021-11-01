#!/bin/bash

if [ $# -lt 2 ]; then
    echo $0 [port] [dir1] [dir2]...
    exit 1
fi

port=$1
shift

dir=$(mktemp -d)
for tgt_dir in $*;
do
    echo Add directory: $tgt_dir
    abs_path=$(readlink -f $tgt_dir)
    base_name=$(basename $abs_path)
    ln -s $abs_path $dir/$base_name
done
python3 -m http.server $port -d $dir -b 0.0.0.0
rm -rf $dir
