" Author: Douglas Rudolph
" File:   .vimrc
" Date:   December 7th, 2017

" ******************************************************************
" *               Auto-tab & other generic settings                *
" ******************************************************************

    " Turn off default VIm plugin indent settings
    filetype indent off

    " Turn on plugin autoindent settings
    filetype plugin indent on

    " Turns on line numbers
    set number

    " Allows for mouse to be used (scrolling, clicking, highlighting)
    set mouse=a

    " Make tab width 4 spaces
    set tabstop=4

    " When indenting with '>' or '<', use 4 spaces as width
    set shiftwidth=4

    " Make tabs 4 space characters
    set expandtab

    " When coding, make VIm aware of how far I am indented
    set autoindent

    " Copy the previous indenting on auto-indenting
    set copyindent

    " Remembers previous indenting as you add more to files
    set smartindent

    " Column bar on the right
    set colorcolumn=120

    " Highlights the line that is currently being typed on
    set cursorline

    " Highlights the column that is currently being typed on
    set cursorcolumn

    " Turn off text wrapping
    set nowrap

    " Always keep the status bar active
    set laststatus=2

    " Turn on spellcheck for US English
    set spell spelllang=en_us

    " Set Folding method to be manual
    set foldmethod=indent

    " Opens files to the right when vertical splitting
    set splitright

    " Opens files on the bottom when horizontal splitting
    set splitbelow

    " Highlights as typing and permanently keeps highlighting post search
    set incsearch
    set hlsearch

    " Remap :W to :w
    command W w

    " Remap :Q to :q
    command Q q

    " Remap all possible `w` `q` combinations to lowercase `wq`
    command WQ wq
    command Wq wq

    " Remap all altered cases of `:wqa`
    command Wqa wqa
    command WQa wqa
    command WqA wqa
    command WQA wqa

    " Remap jj to esc
    imap jj <Esc>

    "  Turn of syntax highlighting for lines that are too long
    autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif
" ******************************************************************
" *          Terminal & colorscheme specific settings              *
" ******************************************************************

    " Syntax highlighting on
    syntax on

    " Set terminal colors to 16 values for RGB (Only useful for Solarized)
    set t_Co=16

    " Solarized background set to dark
    set background=dark

    " Solarized colorscheme
    colorscheme solarized


" ******************************************************************
" *                            Folds function                      *
" ******************************************************************

    " Folds function headers
    setlocal foldmethod=syntax

    " Doesn't fold all methods on load up
    set foldlevel=99

" *******************************************************************
" *                  VIm features triggered by saving               *
" *******************************************************************

    " Place VIm cursor on the line it was closed on
    if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif
    endif

    " Delete all trailing whitespace on save
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

    " Go through the pathogen directory and run all extesions
    execute pathogen#infect()

    " Run VIm airine
    filetype plugin indent on
    set laststatus=2
    set noshowmode

    " Syntastic settings
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 5
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    " Nerdtree settings
    " Open nerdtree if no file is specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    let g:NERDTreeWinPos = "right"
