#!/bin/bash

if [ $# == 0 ]; then
    echo "$0 <dir1> <dir2> <dir3> ..."
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

for port in {6006..7000}; do
  if [[ "$(lsof -i :$port)" == '' ]]; then
    tensorboard --logdir=$dir --port=$port --host="0.0.0.0";
    break;
  fi;
done

rm -rf $dir
