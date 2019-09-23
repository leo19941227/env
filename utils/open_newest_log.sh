#!/bin/bash

logdir=$1
vim $logdir/"$(ls -rt $logdir | tail -n 1)"

