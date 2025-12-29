set nocompatible

" -- OPTIONS --
" context
set number
set numberwidth=4
set scrolloff=4
set laststatus=2
set nowrap
" filetypes
set encoding=utf-8
scriptencoding utf-8
" theme
syntax enable
" search
set smartcase
set nohlsearch
set incsearch
" whitespace
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set smartindent

" -- KEYMAPS --
" leaders
nnoremap <Space> <Nop>
let mapleader=" "
nnoremap <Bslash> <Nop>
let maplocalleader="\\"
" workflow
nnoremap <Leader>e :enew<CR>:Ntree<CR>
nnoremap <Leader>t :terminal<CR>i
" navigation
vnoremap / y/\V<C-r>"<CR>
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap [T :tabfirst<CR>
nnoremap ]T :tablast<CR>
nnoremap [a :previous<CR>
nnoremap ]a :next<CR>
nnoremap [A :first<CR>
nnoremap ]A :last<CR>
" text manipulation
vnoremap <C-n> :norm<Space>

