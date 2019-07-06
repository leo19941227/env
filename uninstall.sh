#!/bin/bash

rm ~/.vimrc
rm ~/.tmux.conf
rm -rf ~/.vim/bundle

grep -q "DEFINE ENV" ~/.bashrc
if [ $? -eq 0 ]; then
    begin=$(grep -n "# DEFINE ENV START" ~/.bashrc | awk -F ':' '{print $1}')
    end=$(grep -n "# DEFINE ENV END" ~/.bashrc | awk -F ':' '{print $1}')
    sed -e $begin","$end"d" ~/.bashrc > tmp
    mv tmp ~/.bashrc
fi

