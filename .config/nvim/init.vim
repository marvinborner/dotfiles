let mapleader=" "

" Install plugin manager
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Features
Plug 'tpope/vim-surround'

" Menus
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'

" Appearance
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

call plug#end()

" Basics
set bg=dark
set go=a
set nohlsearch
set nocompatible
nnoremap c "_c
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" Basic keymaps
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <Leader>l gt<CR>
map <Leader>h gT<CR>

" Autocomplete
set wildmode=longest,list,full

" Splitting
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" File explorer
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI=1

" Root master super save
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Airline config
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Colorscheme
colorscheme codedark " or molokai

" Better vim diff
if &diff
    highlight! link DiffText MatchParen
endif
