#!/bin/bash

ckpt=$1
dir=$2
python3 $(dirname $0)/helpers/dumpckpt.py $ckpt $dir
