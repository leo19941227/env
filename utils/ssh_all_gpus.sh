#!/bin/bash

ips=$(getip | jq 'select(.state == "running")' | jq -r '.ip' | cut -d. -f 2,3)
for ip in $ips; do
    echo "Dealing with IP ${ip}..."
    if [ $? -eq 0 ]; then
        if ! (for session in $(tmux ls | cut -d: -f 1); do tmux list-windows -t $session -F '#W' | cut -d: -f 1; done) | grep -q -E "^$ip$"; then
            echo "IP ${ip} does not have a window yet. Launch a window with the name ${ip}."
            tmux new-window -n ${ip}
            tmux send-keys 'ssh -t -o StrictHostKeyChecking=no '10.0.$ip' "source /efs-storage/env/init_hoverboard_gpu.sh"' C-m
        else
            echo "IP ${ip} already has a window. Skip."
        fi
    else
        echo "IP ${ip} is not reachable. Skip."
    fi
done
