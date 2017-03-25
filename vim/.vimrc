" Author: Douglas Rudolph
" File:   .vimrc
" Date:   March 25th, 2017   


" ******************************************************************
" *               Auto-tab & other indent settings                 *
" ******************************************************************

    " 1.) Turn off default VIm plugin indent settings
    filetype indent off
    
    " 2.) Turn on plugin autoindent settings 
    filetype plugin indent on

    " 3.) Make tab with 4 spaces
    set tabstop=4
    
    " 4.) When indenting with '>' or '<', use 4 spaces as width
    set shiftwidth=4
    
    " 5.) Make tabs 4 space characters
    set expandtab 

    " 6.) When coding, make VIm aware of how far I am indented
    set autoindent 

" ******************************************************************
" *          Terminal & colorscheme specific settings              *
" ******************************************************************
    
    "Syntax highlighting on
    syntax on

    " Set terminal colors to 16 values for RGB (Only useful for Solarized)
    " (*NOTE: Other colorschemes usually requre 256)
    set t_Co=16    	 
    
    " Solarized background set to dark
    set background=dark
    
    "Colorscheme set to Solarized
    colorscheme solarized

    " Turns on line numbers
    set number

    "Make line numbers adjust according to the position of the cursor
    set relativenumber

" ******************************************************************
" *                            Folds function                      *
" ******************************************************************
    
    " Folds function headers
    setlocal foldmethod=syntax

" ******************************************************************
" *           Select lines and Vim Splits with mouse               *
" ******************************************************************
    
    set mouse=a
    set colorcolumn=100

" ******************************************************************
" *          Turn off arrow keys and replace with home-row         *
" ******************************************************************
    
    noremap <Up> <Nop>  
    noremap <Down> <Nop>
    noremap <Left> <Nop>
    noremap <Right> <Nop>

" *******************************************************************
" *                  Favorite Eclipse Key-bindings                  *
" *******************************************************************

    " 1.) Map <Ctrl+d> to cut the current line of the cursor
    map <C-d> dd 

    " 2.) Map auto complete from <Ctrl+p> to <Ctrl+Space>
    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>
    
    "3. Map <Alt+Up> to swap the current line and the one above it
    "map <A-j>=dd p

    "4. Map <Alt+Down> to swap the current line and the one below it
    "map <A-k>=dd k p  

" *******************************************************************
" *         Loading VIm extensions thorugh pathogen                 *
" *******************************************************************

    " - Turns on pathogen 
    " - Pathegon packages:
    "       1. vim-airline
    execute pathogen#infect()
    filetype plugin indent on
    set laststatus=2
    set noshowmode
