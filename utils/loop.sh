#!/bin/bash

while true;
do
    echo Execute the command \"$*\"
    eval "$*"
    sleep 10
done
