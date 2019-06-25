cp .vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

scheme_path=~/.vim/bundle/vim-colorschemes/colors/
cp monokai-leo.vim "$scheme_path"
