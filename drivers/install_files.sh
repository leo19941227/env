#!/bin/bash

# MOVE CONFIG FILES
shopt -s dotglob
cp configs/* ~/
shopt -u dotglob

# install colorscheme
scheme_path=~/.vim/bundle/vim-colorschemes/colors/
if [ ! -d "$scheme_path" ]; then
    mkdir -p "$scheme_path"
fi
cp tools/monokai-leo.vim "$scheme_path"

# if .bashrc not yet execute .bash_leo
if [ -n "$BASH_LEO_ADDED" ]; then
    cat tools/bashrc_new_content.sh >> ~/.bashrc
fi

# let the script takes effect on this login session
if [ -f ~/.bash_leo ]; then
    BASH_LEO_ADDED="true"
    . ~/.bash_leo
fi

