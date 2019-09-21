#!/bin/bash

# install vundle for vim
vundle_dir="~/.vim/bundle/Vundle.vim"
[ -d $vundle_dir ] && rm -rf $vundle_dir
git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir

# install tpm for tmux
tpm_dir="~/.tmux/plugins/tpm"
[ -d $tpm_dir ] && rm -rf $tpm_dir
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

