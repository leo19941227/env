" INSTALL PLUGINS

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mkitt/tabline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-commentary'
Plugin 'suy/vim-context-commentstring'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'alvan/vim-closetag'
Plugin 'valloric/matchtagalways'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'prettier/vim-prettier'
Plugin 'flazz/vim-colorschemes'

call vundle#end()            " required
filetype plugin indent on    " required



" REGULAR VIM SETTINGS

syntax on
set ff=unix
set nowrap
set relativenumber
set cursorline
set nocompatible
set wildmenu
set nobackup
set noswapfile
set undofile
set undodir=~/.vimundo/
set nowritebackup
set textwidth=0

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set showmatch
set splitright
set updatetime=100

" hide the status bar from original vim, cause alareay 
" use another plugin for status bar
set noshowmode
set laststatus=0
set noshowcmd

set wildignore+=*/node_modules/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|jpg|png)$',
    \ }
set switchbuf+=usetab,newtab



" KEY BINDINGS

let mapleader = ","

map <C-c> <ESC>
nmap <C-l> 20zl
nmap <C-h> 20zh
nmap <C-j> <C-d>
nmap <C-k> <C-u>
nmap <leader>/ :set relativenumber! nonumber<CR>
nmap <leader>. :set number! norelativenumber<CR>
nmap <leader>' :GitGutterToggle<CR>
nmap <leader>m :NERDTreeToggle<cr>:NERDTreeMirror<cr>
nmap <leader>b :b#<CR>
nmap <leader>c :Glog!<CR>y:cope<CR>
nmap <leader>g :G<CR>
nmap <leader>q :q<CR>

nmap <leader>j :tabnew 
nmap <leader>n :NERDTreeClose<CR>:tabnext<CR>
nmap <leader>p :NERDTreeClose<CR>:tabprevious<CR>
nmap <leader>1 :NERDTreeClose<CR>:tabn 1<CR>
nmap <leader>2 :NERDTreeClose<CR>:tabn 2<CR>
nmap <leader>3 :NERDTreeClose<CR>:tabn 3<CR>
nmap <leader>4 :NERDTreeClose<CR>:tabn 4<CR>
nmap <leader>5 :NERDTreeClose<CR>:tabn 5<CR>
nmap <leader>6 :NERDTreeClose<CR>:tabn 6<CR>
nmap <leader>7 :NERDTreeClose<CR>:tabn 7<CR>
nmap <leader>8 :NERDTreeClose<CR>:tabn 8<CR>
nmap <leader>9 :NERDTreeClose<CR>:tabn 9<CR>
nmap <leader>0 :NERDTreeClose<CR>:tabn 10<CR>
nmap <leader>q1 :wa<CR>:1tabclose<CR>
nmap <leader>q2 :wa<CR>:2tabclose<CR>
nmap <leader>q3 :wa<CR>:3tabclose<CR>
nmap <leader>q4 :wa<CR>:4tabclose<CR>
nmap <leader>q5 :wa<CR>:5tabclose<CR>
nmap <leader>q6 :wa<CR>:6tabclose<CR>
nmap <leader>q7 :wa<CR>:7tabclose<CR>
nmap <leader>q8 :wa<CR>:8tabclose<CR>
nmap <leader>q9 :wa<CR>:9tabclose<CR>
nmap <leader>q0 :wa<CR>:0tabclose<CR>



" COLOR SETTINGS

" TRICKY SETTING TO LET VIM COLOR WORK CORRECTLY IN TMUX 
" set background=dark
colorscheme monokai-leo

" highlight clear CursorLine
" highlight CursorLine ctermbg=235
" highlight CursorLineNR ctermfg=yellow
" highlight LineNr ctermfg=240
" highlight Comment ctermfg=240

" configure sign column
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=black
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight Visual cterm=NONE ctermbg=238










