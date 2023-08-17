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
Plugin 'tpope/vim-fugitive'
Bundle 'git://github.com/urso/haskell_syntax.vim.git'
" Plugin 'mxw/vim-jsx'
call vundle#end()

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'

" need to `brew install bat` in order for syntax highlighting to work
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
let g:airline_theme = 'base16_gruvbox_dark_hard'

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
set ignorecase " makes search case insensitive
set noshowmode " hide the modal bar - make room for  vim airline

colorscheme gruvbox

imap jj <Esc>

" I can't type
command W w
command Q q
command WQ wq
command Wq wq
command Wqa wqa
command WQa wqa
command WqA wqa
command WQA wqa
command Qa qa
command QA qa

" Place VIm cursor on the line it was closed on
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal! g'\"" | endif
endif

" Delete all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" the `option` key on macOS acts as a modifier key to show greek letters.
" because of this, you can't just easily map the `option` key to act as
" the `meta` key in (neo)vim. to get around this, I'm mapping the greek
" letter that shows up when I press `option + <some-key>` to be `meta + <some-key>
"
" map `option + p` to open fzf fuzzy file search
map π <M-p>
nnoremap <M-p> :Files<Cr>

" map `option + p` to fuzzy global string search
nnoremap <M-f> :Rg<Cr>
map ƒ <M-f>

" map `opton + o` to open Nerd tree in the same directory as the buffer my cursor is in
map ø <M-o>
map <M-o> :NERDTreeToggle %<CR>


" replaces a highlighted term with a string throughout an entire file
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left>
