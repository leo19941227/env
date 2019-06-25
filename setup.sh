host=b03902130@linux1.csie.ntu.edu.tw
scp "$host":~/.vimrc ~/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

scheme_path=~/.vim/bundle/vim-colorschemes/colors/
scp "$host":"$scheme_path"monokai-leo.vim "$scheme_path"
