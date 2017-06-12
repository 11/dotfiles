" Author: Douglas Rudolph
" File:   .vimrc
" Date:   May 16th, 2017   

" ******************************************************************
" *               Auto-tab & other indent settings                 *
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
    

" ******************************************************************
" *          Terminal & colorscheme specific settings              *
" ******************************************************************
    
    " 13.) Syntax highlighting on
    syntax on

    " 14.) Set terminal colors to 16 values for RGB (Only useful for Solarized)
    " (*NOTE: Other colorschemes usually requre 256)
    " (*NOTE: Solarized requires t_Co=16)
    " (*NOTE: Darcula requires t_Co=256)
    " (*NOTE: Molokai requires t_Co=256)
    " (*NOTE: Gruvbox requires t_Co=256)
    set t_Co=16
    
    " 15.) Solarized background set to dark
    set background=light
   
    " 16.) Colorscheme set to molokai
    colorscheme solarized 

    " 17.) Turns on line numbers
    set number

" ******************************************************************
" *                            Folds function                      *
" ******************************************************************
    
    " 18.) Folds function headers
    setlocal foldmethod=syntax

    " 19.) Doesn't fold all methods on load up
    set foldlevel=99

" ******************************************************************
" *           Select lines and Vim Splits with mouse               *
" ******************************************************************
    
    " 20.) Allows for mouse to be used (scrolling, clicking, highlighting)
    set mouse=a

    " 21.) Column bar on the right
    set colorcolumn=80

" ******************************************************************
" *          Turn off arrow keys and replace with home-row         *
" ******************************************************************
    
    " 22.) Turn off up key in Normal Mode
    noremap <Up> <Nop> 

    " 23.) Turn off down key in Normal Mode
    noremap <Down> <Nop>

    " 24.) Turn off left key in Normal Mode
    noremap <Left> <Nop>

    " 25.) Turn off right key in Normal Mode
    noremap <Right> <Nop>

" *******************************************************************
" *                  Favorite Eclipse Key-bindings                  *
" *******************************************************************

    " 26.) Map <Ctrl+d> to cut the current line of the cursor
    map <C-d> dd  

    " 27.) Map auto complete from <Ctrl+p> to <Ctrl+Space>
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
" *   Make VIm place the cursor in the position VIm was closed on   *
" *******************************************************************
    
    " 28.) Place VIm cursor on the line it was closed on 
    if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif
    endif


" *******************************************************************
" *             Loading VIm extensions thorugh pathogen             *
" *******************************************************************

    " - Turns on pathogen 
    " - Pathegon packages:
    "       1. VIm-airline
    "       2. Syntastic 
    "       3. Nerd Tree
    "       4. Conque
    
    " 29.) Go through the pathogen directory and run all extesions
    execute pathogen#infect()
    
    " 30.) Run VIm airine
    filetype plugin indent on
    set laststatus=2
    set noshowmode

    " 31.) Syntastic settings
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 5
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    " 32.) Nerdtree settings
    " 33.) Open nerdtree if no file is specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
