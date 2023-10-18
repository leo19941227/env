#!/bin/bash

if [ $# == 0 ]; then
    echo Please provide directories for the Tensorboard.
    return 1
fi

dir=$(mktemp -d)
for tgt_dir in $*;
do
    echo Add directory: $tgt_dir
    abs_path=$(readlink -f $tgt_dir)
    base_name=$(basename $abs_path)
    uuid=$(uuidgen)
    uuid=${uuid:0:8}
    mkdir -p $dir/$uuid
    ln -s $abs_path $dir/${uuid}/${base_name}
done
tensorboard --logdir $dir --port 0 --host 0.0.0.0
rm -rf $dir

