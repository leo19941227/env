# SETUP TMUX
cp .tmux.conf ~/

# SETUP VIM
cp .vimrc ~/

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# install colorscheme
scheme_path=~/.vim/bundle/vim-colorschemes/colors/
cp monokai-leo.vim "$scheme_path"
