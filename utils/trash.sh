#!/bin/bash

declare -a finalopts
finalopts=()

for o in "$@"; do
    if [ "${o: :1}" = "-" ]; then
        continue
    fi
    finalopts+=("$o")
done

target_num="${#finalopts[@]}"
if [ $target_num -eq 0 ]; then
    echo Please specify files/directories to move
fi
echo Targets \(files/directories\) specified: $target_num

for target in "${finalopts[@]}"; do
    if [ -f $target ] || [ -d $target ]; then
        mount_point=$(df $target | tail -n +2 | awk '{print $6}')
        touch "$mount_point"/has_permission &>/dev/null
        if [ $? -ne 0 ]; then
            mount_point="~/"
        else
            rm "$mount_point"/has_permission
        fi
        trash_path="$mount_point"/.trash
        if [ ! -d $trash_path ]; then
            mkdir $trash_path
        fi
        mv $target $trash_path
    else
        echo Not exists: $target
    fi
done

