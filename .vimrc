set number
set relativenumber
set autoindent
set cindent
syntax on
set tabstop=4 shiftwidth=4 expandtab smarttab
set hlsearch
set ignorecase
set incsearch
set smartcase
set wildmenu
set title
set cursorline
set laststatus=2
set cino+=L0
set autowrite "for go-vim

let mapleader = ","
nnoremap <Leader>n :NERDTreeToggle<Enter>

call plug#begin('~/.vim/plugged')


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fatih/molokai'

call plug#end()

" Vim-go configuration
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1

" Nerdtree configuration
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Color scheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
