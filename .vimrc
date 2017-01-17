" Tab are 4 spaces and auto-indents when I press <Enter>
set tabstop=4
set autoindent

" Set terminal colors to use all 256 values for RGB 
set term=screen-256color
set t_Co=256
colorscheme gruvbox
set background=dark

" Turns on line numbers
:set number
set relativenumber

" Folds function
:setlocal foldmethod=syntax

" Set mouse coordinates
:set mouse=a
set colorcolumn=100

" Turn off arrow keys because I'm no fool!
noremap <Up> <Nop>  
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Turns on auto complete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
