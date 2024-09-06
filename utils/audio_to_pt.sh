#!/bin/bash

if [ $# != "2" ]; then
    echo "$0 <audio_dir> <pt_dir>"
    exit 1
fi

python3 ~/env/utils/torch/audio_to_pt.py $1 $2
