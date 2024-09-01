#!/bin/bash

ips=$(/usr/bin/curl -s https://host-discovery.hoverboard | jq -r -c '.[] | .privateIpAddress')
for ip in $ips;
do
    ping -c 4 $ip > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        window_name=$(echo $ip | awk -F '.' '{print $3 "." $4}')
        if ! tmux list-windows | grep -q "$window_name"; then
            tmux new-window -n ${window_name}
            tmux send-keys 'ssh -t -o StrictHostKeyChecking=no '$ip' "source /efs-storage/env/init_hoverboard_gpu.sh"' C-m
        fi
    fi
done
