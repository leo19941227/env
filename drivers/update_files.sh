#!/bin/bash

# INSTALL CONFIG FILES
shopt -s dotglob
cp configs/* ~/
shopt -u dotglob

# INSTALL COLORSCHEME
scheme_path=~/.vim/bundle/vim-colorschemes/colors/
if [ ! -d "$scheme_path" ]; then
    mkdir -p "$scheme_path"
fi
cp assets/monokai-leo.vim "$scheme_path"

# INSTALL BASH ENV
grep -q "DEFINE ENV" ~/.bashrc
if [ $? -eq 0 ]; then
    begin=$(grep -n "# DEFINE ENV START" ~/.bashrc | awk -F ':' '{print $1}')
    end=$(grep -n "# DEFINE ENV END" ~/.bashrc | awk -F ':' '{print $1}')
    sed -e $begin","$end"d" ~/.bashrc > tmp
    mv tmp ~/.bashrc
fi
cat assets/env.sh >> ~/.bashrc

# let the script takes effect on this login session
source assets/env.sh

