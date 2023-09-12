#!/bin/bash

env_name=$1
env_dir=~/venv/$env_name/
filename=${BASH_SOURCE[0]}

if [ $# != 1 ]; then
    echo "Usage: source ${filename} <env_name>"
    return 1
fi

if [ ! -d $env_dir ]; then
    echo The virtual environment \"$env_name\" does not exist!
    return 1
fi

. $env_dir/bin/activate

