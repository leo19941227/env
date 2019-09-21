#!/bin/bash

# install tpm for tmux
tpm_dir=$HOME/.tmux/plugins/tpm
[ -d $tpm_dir ] && rm -rf $tpm_dir
git clone https://github.com/tmux-plugins/tpm $tpm_dir

