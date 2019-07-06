#!/bin/bash

# install files
. drivers/update_files.sh

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "continue" | vim +PluginInstall +qall

