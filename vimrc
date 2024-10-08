" INSTALL PLUGINS
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'google/vim-searchindex'
Plugin 'haya14busa/vim-asterisk'
Plugin 'sheerun/vim-polyglot'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

call vundle#end()            " required
filetype plugin indent on    " required

" COLORSCHEME
colorscheme monokai

set foldmethod=syntax
set diffopt+=vertical

" gruvbox settings
let g:gitgutter_override_sign_column_highlight=1
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='medium'

" REGULAR VIM SETTINGS
syntax on
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
set vb t_vb=     " no visual bell & flash

" bug fix for WSL
set t_ut=""

" default will be the pane size and auto wrap when inserting
set textwidth=0
set wrapmargin=0

" use tab to select candidates when opening new file
set wildmenu
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip,*.bak,*.class
                \*.jpg,*.png,*/data/*,*/__pycache__/*,
                \*.pyc,*.exe,*.ckpt

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

" paste mode is useful for pasting codes from other places (eg. github)
" cause the autoindent will ruin the pasting content
" One can use this shortcut to enter paste mode
" to cancel paste mode: <C-c><C-c> (two times of C-c)
set pastetoggle=<f2>

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

augroup yaml_settings
    autocmd!
    autocmd FileType yaml setlocal et ts=2 sw=2 sts=2
augroup END

set backspace=indent,eol,start
set autoindent
set showmatch
set splitright

" hide the status bar from original vim, cause alareay
" use another plugin for status bar
set noshowmode
set noshowcmd


" PLUGIN SETTINGS
let g:indentLine_char = '┊'
set updatetime=100  " for gitgutter, or else default refresh time is 4 secs
set laststatus=2  " for ligitline to correctly render the status bar
let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename'] ],
            \   'right': [ [ 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'fileformat', 'fileencoding', 'filetype'] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'fileformat': 'LightlineFileformat',
            \   'filetype': 'LightlineFiletype',
            \   'fileencoding': 'LightlineFileencoding',
            \   'filename': 'LightlineFilename'
            \ },
            \ }

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? &fileencoding : ''
endfunction

function! LightlineFilename()
    let filename = expand('%:r') !=# '' ? expand('%:r') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction

map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1

let g:jedi#goto_command = "zd"
let g:jedi#goto_assignments_command = "zg"
let g:jedi#documentation_command = "zk"
let g:jedi#usages_command = "zn"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "zr"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = 2
autocmd FileType python setlocal completeopt-=preview

" MAPPINGS FOR NATIVE VIM
let mapleader = ","

" use ctrl c to cancel any mode (back to normal) is very handy
map <C-c> <ESC>:noh<CR>:set nopaste<CR>

nnoremap <leader>R :source ~/.vimrc<CR>
nnoremap <leader>C :let @/=""<CR>
nnoremap <leader>T :set expandtab!<CR>
nnoremap <leader>E :bufdo e<CR>

" moving around file, up/down/left/right halfpage
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap J 5j
nnoremap K 5k
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
" horizontal page moving
nnoremap <C-l> 20zl
nnoremap <C-h> 20zh

nnoremap <leader>f f_l
nnoremap <leader>g hF_l

" for quick jump (press [number] + [k/j] to relatively jump up/down several lines
" for debugging (need to see the absolute line number)
nnoremap <leader>n :set relativenumber!<CR>
nnoremap <leader>j :set number!<CR>

" map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" search for visually selected text
" vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>


" MAPPINGS FOR PLUGIN
nnoremap <leader>' :GitGutterToggle<CR>:GitGutterAll<CR>
nnoremap <leader>m :NERDTreeToggle<CR>:NERDTreeMirror<CR>
nnoremap <leader>b :b#<CR>
nnoremap <leader>cb :GV<CR>
nnoremap <leader>ca :GV --all<CR>
nnoremap <expr> <leader>s (":<C-U>execute 'GV stash@{' . v:count . '}' <CR>")
nnoremap <leader>G :G<CR><C-w>o
nnoremap <leader>D :Gvdiff<CR>
nnoremap <leader>. :w<CR>
nnoremap <leader>/ :q<CR>
nnoremap <leader>f :FormatCode<CR>
nnoremap <leader>o :e ~/


" MAPPINGS FOR TAB
" create and move between tabs
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabonly<CR>
nnoremap <expr> tt (v:count == 0 ? ":tabnew<CR>" : ":<C-U>execute v:count 'tabnext'<CR>")
nnoremap <expr> tq (v:count == 0 ? ":tabclose<CR>" : ":<C-U>execute v:count 'tabclose'<CR>")


" AUTOCMD
autocmd TabLeave * NERDTreeClose  " all trees should be closed when belong to inactive tab
autocmd VimEnter * set winfixwidth  " prevent nerdtree to collapse the original window layout


" IGNORE BATTLESHIP PREINSTALLED PACKAGEDS
set runtimepath-=/usr/share/vim/vimfiles

