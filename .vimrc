nnoremap <SPACE> <Nop>
let mapleader=" "

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'cohama/lexima.vim'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'matze/vim-move'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'eapache/rainbow_parentheses.vim'
Plug 'lucasprag/simpleblack'
call plug#end()

silent! source $VIMRUNTIME/defaults.vim

" fix alt key on alacritty
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw

syntax on
colorscheme simpleblack
filetype plugin indent on
set background=dark
set fileformats=unix,dos,mac
set noruler
set notitle
set go=a
set mouse=a
set ttymouse=sgr
set autoindent
set autoread
set backspace=indent,eol,start
set display=lastline
set history=10000
set encoding=utf-8
set hlsearch
set incsearch
set backupdir=/tmp
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set laststatus=2
set mouse=a
set smarttab
set ttyfast
set viminfo+=!
set wildmenu
set shortmess=atOI
set ignorecase
set smartcase
set shiftwidth=4
set tabstop=4
set softtabstop=4
set splitright
set splitbelow
set autowrite
set mousehide
set hidden
set t_Co=256
set t_ut=
set number
set norelativenumber
set cursorline
set scrolljump=1
set scrolloff=0
set noshowcmd
set showmode
set showmatch
set matchtime=5
set report=0
set linespace=0
set pumheight=20
set winminheight=0
set wildmode=list:longest,full
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set fillchars=stl:\ ,stlnc:\ ,fold:\ ,vert:│ 
set whichwrap+=<,>,h,l
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set noswapfile

autocmd FileType * hi LineNr ctermfg=darkgrey
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nmap <silent> ; :FZF<CR>
nmap <silent> <Leader>s :nohl<CR>
nmap <silent> <Leader>h :tabprevious<CR>
nmap <silent> <Leader>l :tabnext<CR>

nnoremap Y y$
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :qa!<CR>
nnoremap <silent> <Leader>wq :wq<CR>
nnoremap <silent> <Leader>ww :w<CR>

call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'markdown'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'markdown'})
"call lexima#add_rule({'char': '*', 'input_after': '*', 'filetype': 'markdown'})
"call lexima#add_rule({'char': '<BS>', 'at': '\*\%#\*', 'delete': 1, 'filetype': 'markdown'})
call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'tex'})
call lexima#add_rule({
\ 'filetype': 'tex',
\ 'char': '<CR>',
\ 'input': '<CR>',
\ 'input_after': '<CR>\\end{\1}',
\ 'at': '^.*\\begin{\([^}]*\)}\(\[.*\]\)*\%#$',
\ 'with_submatch': 1,
\ })
call lexima#add_rule({
\ 'filetype': 'markdown',
\ 'char': '<CR>',
\ 'input': '<CR>',
\ 'input_after': '<CR>\\end{\1}',
\ 'at': '^.*\\begin{\([^}]*\)}\(\[.*\]\)*\%#$',
\ 'with_submatch': 1,
\ })

nnoremap S :%s//g<Left><Left>
nnoremap d "_d
vnoremap d "_d
nmap j gj
nmap k gk
vmap j gj
vmap k gk

command! W w !sudo tee % > /dev/null

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md'}]

set signcolumn=no
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
let g:gitgutter_signs=1
let g:gitgutter_highlight_lines=1
let g:gitgutter_map_keys=0
autocmd VimEnter * GitGutterLineHighlightsEnable

let g:ale_fix_on_save = 1
let g:ale_set_signs = 0
let g:ale_fixers = {}
let g:ale_fixers.haskell = ['brittany']
let g:ale_fixers.c = ['clang-format']
let g:ale_fixers.cpp = ['clang-format']
let g:ale_fixers.sh = ['shfmt']
let g:ale_fixers.markdown = ['pandoc']
let g:ale_fixers.javascript = ['xo']
let g:ale_fixers.java = ['google_java_format']
let g:ale_fixers.tex = ['latexindent']
let g:ale_fixers.python = ['black']
let g:ale_fixers.r = ['styler']
let g:ale_fixers.rust = ['rustfmt']
let g:ale_linters = {}
let g:ale_linters.haskell = ['hlint']
let g:ale_linters.sh = ['shellcheck']
let g:ale_linters.javascript = ['xo']
let g:ale_linters.r = ['lintr']
let g:ale_linters.python = ['ruff']

nmap <silent> <leader>j :ALENext<cr>
nmap <silent> <leader>k :ALEPrevious<cr>
nmap <silent> <leader>d :ALEDetail<cr>

" let g:ale_markdown_pandoc_options = '-s -t gfm -'
let g:ale_markdown_pandoc_options = '-s -f markdown+yaml_metadata_block -t markdown -'
let g:ale_virtualtext_cursor = 'disabled'

au Syntax * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesActivate

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
highlight SignColumn cterm=NONE ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
highlight TabLine cterm=NONE ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
highlight TabLineFill cterm=NONE ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
highlight ALEError ctermbg=none cterm=underline
highlight GitGutterChangeLine cterm=italic ctermbg=NONE
highlight GitGutterAddLine cterm=bold ctermbg=NONE
highlight GitGutterDeleteLine cterm=underline guisp=red
highlight clear SignColumn

autocmd FileType c set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType cpp set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType haskell set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType java set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType js set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType r set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType tex set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType bruijn set tabstop=4|set shiftwidth=4|set noexpandtab
