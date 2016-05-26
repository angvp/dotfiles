" angvp's .vimrc config
let mapleader = " "
let maplocalleader = " "
set nocompatible

call plug#begin('~/.vim/plugged')
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
" cool bars
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" colors
Plug 'altercation/vim-colors-solarized'
" class/module browser
" to be removed?
Plug 'majutsushi/tagbar'
" Zen coding
Plug 'mattn/emmet-vim'
" Autocompletion
Plug 'AutoComplPop'
" Search results counter
" to be removed (?)
Plug 'IndexedSearch'
" XML/HTML tags navigation
" to be removed (?)
Plug 'matchit.zip'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/syntastic'
Plug 'fisadev/vim-isort'
Plug 'pignacio/vim-yapf-format'
" Virtualenv
Plug 'jmcantrell/vim-virtualenv'
" vim troll stopper
Plug 'vim-utils/vim-troll-stopper'
Plug 'klen/python-mode'
" Fugitive
Plug 'tpope/vim-fugitive'
" JavaScript stuff
Plug 'mtscout6/syntastic-local-eslint.vim'

call plug#end()

set background=dark
let g:solarized_visibility =  "low"
colorscheme solarized
" tunning powerline
"
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg = "dark"
let g:airline_theme = "solarized"
let g:airline#extensions#tabline#enabled = 1

set cmdheight=1
set encoding=utf-8
set termencoding=utf-8
set clipboard=unnamed
set mouse=a
set shortmess+=aI
set showmode
set showcmd
set modeline
set acd " set current working dir
set incsearch
set textwidth=79
set ruler

set splitbelow
set nobackup

" Status line
set wildchar=<tab>
set wildmenu
set wildmode=longest:full,full

set laststatus=2
set nohlsearch
set ignorecase
set smartcase
set showmatch

" set cursorline
set completeopt=menu,menuone,longest,preview
set spelllang=en_us
set spellsuggest=fast,20

set whichwrap=h,l,<,>,[,]
set backspace=indent,eol,start
set nowrap
set history=500
set autoindent
set smartindent
set shiftround

set number

set formatoptions+=nl
set selection=inclusive

if has("folding")
    set foldenable
    set foldmethod=marker
    set foldlevel=100
endif

let html_use_css=1

" autofocus on tagbar open
let g:tagbar_autofocus = 1

" Clear autocmds - starts from a clean slate
autocmd!
autocmd BufWritePre *.py mark z | %s/ *$//e | 'z
" Filetype stuff
filetype on
filetype plugin on
filetype indent on

" Fix filetype detection
au BufNewFile,BufRead .torsmorc* set filetype=rc
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.sys set filetype=php
au BufNewFile,BufRead grub.conf set filetype=grub
au BufNewFile,BufRead PKGBUILD set filetype=pkgbuild

" C file specific options
au FileType c,cpp set cindent
au FileType c,cpp set formatoptions+=ro
au FileType c,cpp set makeprg=gcc\ -Wall\ -O2\ -o\ %<\ %

" Python abbreviations
au FileType python iab putf8 # -*- coding: utf-8 -*-
au FileType python setlocal et ts=4 sw=4 sts=4
" JavaScript abbreviations
au FileType javascript setlocal et ts=2 sw=2 sts=2

au FileType pkgbuild iab maintainer # Maintainer: Angel Velasquez <angvp@archlinux.org>
au FileType yaml setlocal et ts=2 sw=2 sts=2

" Buffer handling
nnoremap <C-o> :bp!<CR>
nnoremap <C-p> :bn!<CR>
nnoremap <C-k> :bd!<CR>

" Cuz I am too lazy
map q :bd!<CR>

" select all
nnoremap <C-e> ggVG
" FZF config
nnoremap <silent> <leader><C-P> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader><C-R>source $MYVIMRC<CR>

set fillchars+=stl:\ ,stlnc:\

" trollstopper
highlight TrollStopper ctermbg = red guibg = #FF0000

" yapf
let g:yapf_format_yapf_location = '/usr/local/bin/yapf'

" syntastic
let g:syntastic_check_on_open=1

syntax on
