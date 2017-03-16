" Turn autoindent for filetype plugins
" Set text encoding to be utf-8
filetype indent off
filetype plugin indent on

" show existing tab with 4 spaces width
" On pressing tab, insert 4 spaces
" when indenting with '>', use 4 spaces width
set tabstop=4
set shiftwidth=4
set expandtab 
set autoindent 

" Set terminal colors to use all 16 values for RGB 
syntax on
set t_Co=16    		"only useful for solarized 
set background=dark
colorscheme solarized

" Turns on line numbers
set number
set relativenumber

" Folds function
setlocal foldmethod=syntax

" Set mouse coordinates
set mouse=a
set colorcolumn=100

" Turn off arrow keys because I'm no fool!
noremap <Up> <Nop>  
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Turns on pathogen 
" PATHOGEN PACKAGES: 
" 	1. vim-airline
execute pathogen#infect()
filetype plugin indent on
set laststatus=2
set noshowmode
