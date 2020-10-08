#!/bin/bash

rootdir=$1
newname=$2

python3 $(dirname $0)/helpers/fix_ckptname.py $rootdir $newname
