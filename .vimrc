" Author: Douglas Rudolph
" File:   .vimrc
" Date:   May 16th, 2017

" ******************************************************************
" *               	  Generic Settings	                   *
" ******************************************************************

    " 1.) Turn off default VIm plugin indent settings
    filetype indent off

    " 2.) Turn on plugin autoindent settings
    filetype plugin indent on

    " 3.) Make tab width 4 spaces
    set tabstop=4

    " 4.) When indenting with '>' or '<', use 4 spaces as width
    set shiftwidth=4

    " 5.) Make tabs 4 space characters
    set expandtab

    " 6.) When coding, make VIm aware of how far I am indented
    set autoindent

    " 7.) Copy the previuos indeting on autoindenting
    set copyindent

    " 8.) Remembers previous indenting as you add more to files
    set smartindent

    " 9) Highlights the line that is currently being typed on
    set cursorline

    " 10.) Highlights the column that is currently being typed on
    set cursorcolumn

    " 11.) Turn off text wrapping
    set nowrap

    " 12.) Always keep the status bar active
    set laststatus=2

    " 13.) Turn on spellcheck for US English
    set spell spelllang=en_us

    " 14.) Set Folding method to be based off of line indents
    set foldmethod=indent

    " 15.) Opens files to the right when vertical splitting
    set splitright

    " 16.) Opens files on the bottom when horizontal splitting
    set splitbelow

    " 17.) Highlights as typing and permanently keeps highlighting post search
    set incsearch
    set hlsearch
    
    " 18.) Turns on line numbers
    set number
    
    " 20.) Allows for mouse to be used (scrolling, clicking, highlighting)
    set mouse=a

    " 21.) Column bar to appear at the 120 character mark (keeps lines from being too long)
    set colorcolumn=120

" ******************************************************************
" *          Terminal & colorscheme specific settings              *
" ******************************************************************

    " 1.) Syntax highlighting on
    syntax on

    " 2.) Set terminal colors to 16 values for RGB (Only useful for Solarized)
    " (*NOTE: Other colorschemes usually requre 256)
    " (*NOTE: Solarized requires t_Co=16)
    " (*NOTE: Darcula requires t_Co=256)
    " (*NOTE: Molokai requires t_Co=256)
    " (*NOTE: Gruvbox requires t_Co=256)
    set t_Co=16

    " 3.) Solarized (and several other) backgrounds can be set to light or dark themes
    set background=light

    " 4.) Colorscheme set to molokai
    colorscheme solarized

" ******************************************************************
" *                            Folds function                      *
" ******************************************************************

    " 1.) Folds function headers
    setlocal foldmethod=syntax

    " 2.) Doesn't fold all methods on load up
    set foldlevel=99

" ******************************************************************
" *          Turn off arrow keys and replace with home-row         *
" ******************************************************************

    " 1.) Turn off up key in Normal Mode
    noremap <Up> <Nop>

    " 2.) Turn off down key in Normal Mode
    noremap <Down> <Nop>

    " 3.) Turn off left key in Normal Mode
    noremap <Left> <Nop>

    " 4.) Turn off right key in Normal Mode
    noremap <Right> <Nop>

" *******************************************************************
" *                  Favorite Eclipse Key-bindings                  *
" *******************************************************************

    " 1.) Map auto complete from <Ctrl+p> to <Ctrl+Space>
    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
    \ "\<lt>C-n>" :
    \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>

    " 2.) Map <Alt+Up> to swap the current line and the one above it
    "map <A-j>=dd p

    " 3.) Map <Alt+Down> to swap the current line and the one below it
    "map <A-k>=dd k p

" *******************************************************************
" *                  VIm features triggered by saving               *
" *******************************************************************

    " 1.) Place VIm cursor on the line it was closed on
    if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif
    endif

    " 2.) Delete all trailing whitespace on save
    autocmd BufWritePre * :%s/\s\+$//e

" *******************************************************************
" *             Loading VIm extensions thorugh pathogen             *
" *******************************************************************

    " - Turns on pathogen
    " - Pathegon packages:
    "       1. VIm-airline
    "       2. Syntastic
    "       3. Nerd Tree
    "       4. Conque

    " 1.) Go through the pathogen directory and run all extesions
    execute pathogen#infect()

    " 2.) Run VIm airine
    filetype plugin indent on
    set laststatus=2
    set noshowmode

    " 3.) Syntastic settings
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 5
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    " 4.) Nerdtree settings
    " 5.) Open nerdtree if no file is specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    let g:NERDTreeWinPos = "right"
