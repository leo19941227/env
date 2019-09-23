#!/bin/bash

targetdir=$1
k=$2

cd $targetdir

[ -z "$k" ] && k=1
itemnum=$(ls . | wc -l)
trim_num=$(($itemnum - $k))
if [ $trim_num -ge 1 ]
    then
        ls -rt . | head -n $trim_num | xargs rm
        echo "$trim_num" files deleted
    else
        echo No file deleted
fi

cd -

