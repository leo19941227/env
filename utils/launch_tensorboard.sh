#!/bin/bash

if [ $# == 0 ]; then
    echo Please provide directories for the Tensorboard.
    exit 1
fi

dir=$(mktemp -d)
for tgt_dir in $*;
do
    echo Add directory: $tgt_dir
    abs_path=$(readlink -f $tgt_dir)
    base_name=$(basename $abs_path)
    ln -s $abs_path $dir/$base_name
done
tensorboard --logdir $dir --host 0.0.0.0
rm -rf $dir
