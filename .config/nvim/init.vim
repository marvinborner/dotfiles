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
Plug '907th/vim-auto-save'
" Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'

" Menus
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'

" Appearance
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

call plug#end()

" Basics
nnoremap c "_c
filetype plugin indent on
syntax on
set bg=dark
set go=a
set ff=unix
set mouse=a
set nocompatible
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set cindent
set cinkeys-=0#
set cino=
set copyindent
set expandtab
set fileformats=unix,dos,mac
set formatoptions=tcqn1
set hidden
set history=200
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set matchtime=2
set nomodeline
set nobackup
set nonumber
set visualbell t_vb=
set nowritebackup
set ruler
set scroll=4
set sessionoptions-=options
set shiftround
set shiftwidth=8
set shortmess+=A
set showbreak=
set showmatch
set sidescrolloff=3
set smartcase
set softtabstop=8
set suffixes+=.pyc
set tabstop=8
set textwidth=100
set wildmenu
set wildmode=list:longest,full
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules
set encoding=utf-8
set number relativenumber

" Basic keymaps
nmap j gj
nmap k gk
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>a :BD<CR>
nmap <Leader>l :bn<CR>
" TODO: Fix the following line
nmap <Leader>h :bp<CR>
nmap <Leader>S :nohlsearch<CR>

" Several non-retard options
nnoremap ' `
autocmd VimResized * :wincmd =

" Autosave
let g:auto_save=1
let g:auto_save_silent=1

" Splitting
set splitbelow splitright
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" FZF
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>c :Colors<CR>
nmap <Leader>s :Rg!<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --follow -g "!{.git,node_modules}/*" 2>/dev/null'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!{*.lock,*-lock.json}" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:40%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Git implementation
let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:gitgutter_sign_added='∙'
let g:gitgutter_sign_modified='∙'
let g:gitgutter_sign_removed='∙'
let g:gitgutter_sign_modified_removed='∙'
let g:gitgutter_grep='rg'
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ]g :GitGutterNextHunk<CR>
nmap [g :GitGutterPrevHunk<CR>
augroup VimDiff
  autocmd!
  autocmd VimEnter,FilterWritePre * if &diff | GitGutterDisable | endif
augroup END

" Better search highlighting TODO: Fix neovim specific double caret
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
nmap <Leader>F :ALEFix<CR>
nmap ]w :ALENextWrap<CR>
nmap [w :ALEPreviousWrap<CR>
nmap <Leader>f <Plug>(ale_fix)
augroup VimDiff
  autocmd!
  autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END
let g:ale_pattern_options = {
\ '\.c$': {'ale_linters': ['clangtidy'], 'ale_fixers': ['clang-format']},
\ '\.h$': {'ale_linters': ['clangtidy'], 'ale_fixers': ['clang-format']},
\ '\.asm$': {'ale_linters': [], 'ale_fixers': ['trim_whitespace']},
\}
let g:ale_pattern_options_enabled = 1

" File explorer
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI=1
let g:NERDTreeMarkBookmarks=0
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeStatusLine=-1

" Root master super save
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

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
