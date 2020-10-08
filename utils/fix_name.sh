#!/bin/bash

rootdir=$1
newname=$2

bash $(dirname $0)/fix_ckptname.sh $rootdir $newname
bash $(dirname $0)/fix_wandbname.sh $rootdir $newname

