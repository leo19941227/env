#!/bin/bash

ips=$(/usr/bin/curl -s https://host-discovery.hoverboard | jq -r -c '.[] | .privateIpAddress')
for ip in $ips;
do
    window_name=$(echo $ip | awk -F '.' '{print $3 "." $4}')
    tmux new-window -n ${window_name}
    tmux send-keys 'ssh -t -o StrictHostKeyChecking=no '$ip' "bash /efs-storage/init_env.sh && tmux new -s work"' C-m
done
