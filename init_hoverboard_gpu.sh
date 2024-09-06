#!/bin/bash

rm -rf ~/.cache
ln -s /efs-storage/cache ~/.cache

ln -s /efs-storage/env ~/env
echo ". /efs-storage/env/bashrc" >> ~/.bashrc

ln -s /efs-storage/vim ~/.vim
ln -s /efs-storage/env/vimrc ~/.vimrc

mv ~/.tmux.conf ~/.tmux.conf.swp
ln -s /efs-storage/env/tmux.conf ~/.tmux.conf

tmux list-sessions | grep work > /dev/null 2>&1
if [ $? -ne 0 ]; then
    tmux new -d -s work
fi

tmux send-keys -t work 'watch -n 0.5 nvidia-smi' C-m
tmux new-window -t work -n use_gpu
tmux send-keys -t work:use_gpu 'conda config --prepend envs_dirs /efs-storage/conda/envs' C-m
tmux send-keys -t work:use_gpu 'conda config --prepend pkgs_dirs /efs-storage/conda/pkgs' C-m
tmux send-keys -t work:use_gpu 'conda activate audiomar' C-m
tmux send-keys -t work:use_gpu 'use_gpu' C-m
tmux a -t work
