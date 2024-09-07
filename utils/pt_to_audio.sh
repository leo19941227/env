#!/bin/bash

if [ $# != "2" ]; then
    echo "$0 <pt_dir> <audio_dir>"
    return 1
fi

python3 ~/env/utils/torch/pt_to_audio.py $1 $2
