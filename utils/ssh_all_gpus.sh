#!/bin/bash

ips=$(getip | jq 'select(.state == "running")' | jq -r '.ip')
for ip in $ips; do
    echo "Dealing with IP ${ip}..."
    if [ $? -eq 0 ]; then
        window_name=$(echo $ip | awk -F '.' '{print $3 "." $4}')
        if ! (for session in $(tmux ls | cut -d: -f 1); do tmux list-windows -t $session -F '#W' | cut -d: -f 1; done) | grep -q -E "^$window_name$"; then
            echo "IP ${ip} does not have a window yet. Launch a window with the name ${window_name}."
            tmux new-window -n ${window_name}
            tmux send-keys 'ssh -t -o StrictHostKeyChecking=no '$ip' "source /efs-storage/env/init_hoverboard_gpu.sh"' C-m
        else
            echo "IP ${ip} already has a window. Skip."
        fi
    else
        echo "IP ${ip} is not reachable. Skip."
    fi
done
