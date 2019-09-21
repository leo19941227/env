" INSTALL PLUGINS
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
" Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'dracula/vim'
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required

" COLORSCHEME
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
colorscheme dracula

" REGULAR VIM SETTINGS
syntax enable
set fileformat=unix
set viminfo='20,\"50    " read/write a .viminfo file, don't store more

" SET WRAP MODE
" set nowrap
set wrap
set breakindent
set linebreak
set showbreak=\ 

set relativenumber
set number
set cursorline
set switchbuf+=usetab,newtab
set noerrorbells  " disable beep on errors.
" set visualbell    " flash the screen instead of beeping on errors

" default will be the pane size and auto wrap when inserting
set textwidth=0
set wrapmargin=0

" use tab to select candidates when opening new file
set wildmenu
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip,*.bak,*.class
                \*.jpg,*.png,*/data/*,*/__pycache__/*,
                \*.pyc,*.exe

" purely use git to control files
set nobackup
set nowritebackup
set noswapfile

" persistant undo
set undofile
if !isdirectory($HOME.'/.vimundo')
    call mkdir($HOME."/.vimundo", "p")
    endif
set undodir=~/.vimundo

" useful when searching
set ignorecase
" set smartcase  " switch to case-sensitive when search query contains an uppercase letter
set incsearch  " search as characters are entered
set hlsearch   " highlight matches

" visualize tab char in vim
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" standard indent settings
set tabstop=4
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" overide indent setting of vim filetype
augroup python_settings
    autocmd!
    autocmd FileType python setlocal et ts=4 sw=4 sts=4
augroup END

set backspace=indent,eol,start
set autoindent
set showmatch
set splitright

" hide the status bar from original vim, cause alareay
" use another plugin for status bar
set noshowmode
set noshowcmd

" paste mode is useful for pasting codes from other places (eg. github)
" cause the autoindent will ruin the pasting content
set pastetoggle=<F2>


" PLUGIN SETTINGS
let g:indentLine_char = '┊'
set updatetime=100  " for gitgutter, or else default refresh time is 4 secs
set laststatus=2  " for ligitline to correctly render the status bar
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


" KEY BINDINGS
let mapleader = ","

" use ctrl c to cancel any mode (back to normal) is very handy
map <C-c> <ESC>

" source .vimrc
nnoremap <leader>R :source ~/.vimrc<CR>

" turn off search highlight for now, and turn back when searching again
nnoremap <leader>H :nohlsearch<CR>

" toggle between space/tab when inserting <tab>
nnoremap <leader>E :set expandtab!<CR>

" moving around file, up/down/left/right halfpage
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
" horizontal page moving
" nnoremap <C-l> 20zl
" nnoremap <C-h> 20zh

" for quick jump (press [number] + [k/j] to relatively jump up/down several lines
" for debugging (need to see the absolute line number)
nnoremap <leader>n :set relativenumber!<CR>
nnoremap <leader>j :set number!<CR>

" map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" search for visually selected text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>


" FOR PLUGIN
nnoremap <leader>' :GitGutterToggle<CR>:GitGutterAll<CR>
nnoremap <leader>m :NERDTreeToggle<cr>:NERDTreeMirror<cr>
nnoremap <leader>b :b#<CR>
nnoremap <leader>cb :Glog!<CR>
nnoremap <leader>ca :Glog! --all<CR>
nnoremap <leader>cs :Glog! %<CR>
nnoremap <leader>g :G<CR>
nnoremap <leader>. :w<CR>
nnoremap <leader>/ :q<CR>


" FOR TAB
" create and move between tabs
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabonly<CR>
nnoremap <expr> tt (v:count == 0 ? ":tabnew " : ":<C-U>execute v:count 'tabnext'<CR>")
nnoremap <expr> tq (v:count == 0 ? ":tabclose<CR>" : ":<C-U>execute v:count 'tabclose'<CR>")


" IGNORE BATTLESHIP PREINSTALLED PACKAGEDS
set runtimepath-=/usr/share/vim/vimfiles

