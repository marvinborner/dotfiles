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
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'kien/rainbow_parentheses.vim'
Plug 'venantius/vim-cljfmt'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'peterhoeg/vim-qml'
Plug 'dermusikman/sonicpi.vim'
"Plug 'ananagame/vimsence'

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
set noexpandtab
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
set listchars=tab:\ \ ,extends:›,precedes:‹,nbsp:·,trail:·
set matchtime=2
set nomodeline
set nobackup
set nonumber
set visualbell t_vb=
set nowritebackup
set ruler
set scroll=4
set viewoptions=folds,cursor
set sessionoptions=folds
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
set wildmenu
set wildmode=list:longest,full
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules
set encoding=utf-8
set updatetime=100
set number relativenumber
set noro
set notimeout
set ttimeout
set timeoutlen=100

" Basic keymaps
nmap j gj
nmap k gk
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <C-q> :BD<CR>
nmap <C-j> :bn<CR>
nmap <C-k> :bp<CR>
nmap <Leader>S :nohlsearch<CR>

" Fix dumb delete combo
nnoremap d "_d
vnoremap d "_d

" Several non-retard options
nnoremap ' `
autocmd VimResized * :wincmd =

" Autosave
let g:auto_save=0
let g:auto_save_silent=1
autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
autocmd BufWinEnter ?* silent! loadview

" Tagbar
nmap <Leader>T :TagbarToggle<CR>
let g:tagbar_compact=1

" Splitting
set splitbelow splitright
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l

" Terminal
nmap <Leader>t :term<CR>
tnoremap <C-q> <C-\><C-n>:BD!<CR>
tnoremap <Leader><ESC> <C-\><C-n>
nmap <Leader>r :!./run<CR>
nmap <Leader>R :terminal<CR>./run<CR>
autocmd TermOpen * startinsert

" FZF
nmap ; :Files<CR>
nmap <Leader>B :Buffers<CR>
nmap <Leader>C :Colors<CR>
nmap <Leader>c :Commits<CR>
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
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
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
\ '\.cpp$': {'ale_linters': ['clangtidy'], 'ale_fixers': ['clang-format']},
\ '\.h$': {'ale_linters': ['clangtidy'], 'ale_fixers': ['clang-format']},
\ '\.asm$': {'ale_linters': ['gcc'], 'ale_fixers': ['trim_whitespace']},
\ '\.clj$': {'ale_linters': ['joker'], 'ale_fixers': []},
\ '\.sh$': {'ale_linters': ['shellcheck'], 'ale_fixers': ['shfmt']},
\ '\.cs$': {'ale_linters': [], 'ale_fixers': ['uncrustify']},
\ '\.java$': {'ale_linters': [], 'ale_fixers': ['uncrustify']},
\ '\.d$': {'ale_linters': [], 'ale_fixers': ['uncrustify']},
\}
let g:ale_pattern_options_enabled = 1
autocmd FileType cs let g:ale_c_uncrustify_options = '-l CS'
autocmd FileType java let g:ale_c_uncrustify_options = '-l JAVA'
autocmd FileType d let g:ale_c_uncrustify_options = '-l D'

" Something about clojure
let g:clj_fmt_autosave=0

" Custom actions for different filetypes
augroup ft_files
  au!
  au FileType c let b:auto_save=1
  au FileType cs let b:auto_save=1
  au FileType cpp let b:auto_save=1
  au FileType clojure let b:auto_save=1
  au FileType clojure nmap <Leader>F :Cljfmt<CR>
  au FileType clojure RainbowParenthesesLoadRound
  au FileType clojure RainbowParenthesesActivate
  au FileType asm set ft=nasm
augroup END

" File explorer
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['node_modules', 'cross']
let g:NERDTreeMarkBookmarks=0
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeStatusLine=-1
au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Root master super save
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Airline config
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Sonic Pi
let g:sonicpi_command = 'sonic-pi-tool'
let g:sonicpi_send = 'eval-stdin'
let g:sonicpi_stop = 'stop'
let g:vim_redraw = 1

" Colorscheme
colorscheme codedark " or molokai
highlight GitGutterAdd guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" TODOs
command Td :Rg! TODO
command TD :Rg! TODO
command Todo :Rg! TODO
command ToDo :Rg! TODO
command TODO :Rg! TODO

" Better vim diff
if &diff
    highlight! link DiffText MatchParen
endif

" Read strange files
autocmd BufReadPre *.doc silent set ro
autocmd BufReadPost *.doc silent %!antiword "%"

autocmd BufReadPre *.odt,*.odp silent set ro
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"

autocmd BufReadPre *.pdf silent set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78

autocmd BufReadPre *.rtf silent set ro
autocmd BufReadPost *.rtf silent %!unrtf --text

autocmd BufReadPre *.jpg,*.jpeg silent set ro
autocmd BufReadPost *.jpg,*.jpeg silent %!jp2a --width=78 "%"

autocmd BufReadPre *.png,*.gif,*.bmp silent set ro
autocmd BufReadPost *.png,*.gif,*.bmp silent %!convert "%" jpg:- | jp2a --width=78 -
