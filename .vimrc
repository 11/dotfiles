" Load themes plug plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Bundle 'git://github.com/urso/haskell_syntax.vim.git'
" Plugin 'mxw/vim-jsx'
call vundle#end()

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
call plug#end()

" Open NerdTree on the right side of the screen
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinPos = "right"

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

syntax enable

hi htmlTagName guifg=#c0c5ce ctermfg=251
hi htmlEndTag guifg=#c0c5ce ctermfg=251

let g:haskell_enable_quantification = 1
let g:airline_theme='gruvbox'

set t_Co=256
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set copyindent
set smartindent

set foldmethod=indent
set foldlevelstart=99
set foldnestmax=10
set nofoldenable
set foldlevel=2

set mouse=a
set number
set colorcolumn=100
set cursorline
set cursorcolumn
set nowrap
set spell spelllang=en_us
set incsearch
set hlsearch
set splitright
set splitbelow

colorscheme gruvbox

imap jj <Esc>

command W w
command Q q
command WQ wq
command Wq wq

" Place VIm cursor on the line it was closed on
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal! g'\"" | endif
endif

" Delete all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
