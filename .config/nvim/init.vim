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
Plug 'tpope/vim-rhubarb'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'venantius/vim-cljfmt'
Plug 'w0rp/ale'
Plug 'peterhoeg/vim-qml'
Plug 'dermusikman/sonicpi.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'Jacotsu/CoVim-Neovim', {'branch': 'neovim'}
"Plug 'ananagame/vimsence'

" Menus
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'

" Appearance
"Plug 'flazz/vim-colorschemes'
"Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

" Basics
nnoremap c "_c
filetype plugin indent on
syntax on
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set bg=dark
set cindent
set cinkeys-=0#
set cino=
set clipboard=unnamedplus
set copyindent
set encoding=utf-8
set ff=unix
set fileformats=unix,dos,mac
set formatoptions=tcqn1
set go=a
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
set mouse=a
set nobackup
set nocompatible
set noexpandtab
set nomodeline
set nonumber
set noro
set noshowmode
set notimeout
set nowritebackup
set number relativenumber
set ruler
set scroll=4
set sessionoptions=folds
set shiftround
set shiftwidth=8
set shortmess+=A
set showbreak=
set showmatch
set showtabline=2
set sidescrolloff=3
set smartcase
set softtabstop=8
set suffixes+=.pyc
set t_Co=256
set tabstop=8
set termguicolors
set timeoutlen=100
set ttimeout
set updatetime=100
set viewoptions=folds,cursor
set visualbell t_vb=
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules
set wildmenu
set wildmode=list:longest,full

" Basic keymaps
nmap j gj
nmap k gk
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <C-q> :BD<CR>
nmap <C-j> :bn<CR>
nmap <C-k> :bp<CR>
nmap <Leader>S :nohlsearch<CR>
nmap <Leader>z :setlocal foldmethod=syntax<CR>
nnoremap S :%s//g<Left><Left>

" Fix dumb deletion register
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
autocmd TermOpen * startinsert

" Execution
nmap <Leader>a :!echo <c-r>% \| entr compile <c-r>% &<CR><CR>
nmap <Leader>c :w! \| !compile <c-r>%<CR>
nmap <Leader>p :!preview <c-r>%<CR><CR>
nmap <Leader>r :w! \| terminal<CR>./run<CR>

" FZF
nmap ; :Files<CR>
nmap <Leader>B :Buffers<CR>
nmap <Leader>C :Commits<CR>
nmap <Leader>s :Rg!<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --follow -g "!{.git,node_modules}/*" 2>/dev/null'
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\	'rg --column --line-number --no-heading --color=always --smart-case -g "!{*.lock,*-lock.json}" '.shellescape(<q-args>), 1,
	\	<bang>0 ? fzf#vim#with_preview('up:40%')
	\		: fzf#vim#with_preview('right:50%:hidden', '?'),
	\	<bang>0)


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
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
nmap ]w :ALENextWrap<CR>
nmap [w :ALEPreviousWrap<CR>
nmap <Leader>F <Plug>(ale_fix)
augroup VimDiff
	autocmd!
	autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END
let g:ale_linters = {
\ 'asm': ['gcc'],
\ 'c': ['clangtidy'],
\ 'clj': ['joker'],
\ 'cpp': ['clangtidy'],
\ 'elixir': ['credo', 'dialyxir', 'dogma'],
\ 'go': ['gofmt', 'golint', 'go vet'],
\ 'hack': ['hack'],
\ 'javascript': ['eslint'],
\ 'perl': ['perlcritic'],
\ 'python': ['flake8', 'mypy', 'pylint'],
\ 'rust': ['cargo'],
\ 'sh': ['shellcheck'],
\ 'vue': ['eslint', 'vls'],
\ 'zsh': ['shell'],
\}
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'c': ['clang-format'],
\ 'cpp': ['clang-format'],
\ 'cs': ['uncrustify'],
\ 'css': ['prettier'],
\ 'd': ['uncrustify'],
\ 'html': ['prettier'],
\ 'java': ['uncrustify'],
\ 'javascript': ['prettier'],
\ 'json': ['jq'],
\ 'markdown': ['prettier'],
\ 'sh': ['shfmt'],
\ 'tex': ['latexindent'],
\ 'typescript': ['prettier'],
\}
let g:ale_fix_on_save = 1
autocmd FileType cs let g:ale_c_uncrustify_options = '-l CS'
autocmd FileType java let g:ale_c_uncrustify_options = '-l JAVA'
autocmd FileType d let g:ale_c_uncrustify_options = '-l D'

" Something about clojure
let g:clj_fmt_autosave=0

" Custom actions for different filetypes
augroup ft_files
	au!
	au FileType clojure nmap <Leader>F :Cljfmt<CR>
	au FileType clojure RainbowParenthesesLoadRound
	au FileType clojure RainbowParenthesesActivate
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
let g:airline_theme = 'onedark'
let g:airline_extensions = ['tabline', 'tagbar', 'ale', 'term']
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% (%l/%L)'

" Sonic Pi
let g:sonicpi_command = 'sonic-pi-tool'
let g:sonicpi_send = 'eval-stdin'
let g:sonicpi_stop = 'stop'
let g:vim_redraw = 0

" Colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme onedark
"highlight GitGutterAdd guifg=#009900 ctermfg=2
"highlight GitGutterChange guifg=#bbbb00 ctermfg=3
"highlight GitGutterDelete guifg=#ff2222 ctermfg=1

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

" Custom indenting
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType typescript set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType css set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType json set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType html set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType sh set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType c set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType asm set tabstop=8|set shiftwidth=8|set noexpandtab

" File extension actions
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.asm set filetype=nasm

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
