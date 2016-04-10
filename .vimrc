" angvp's .vimrc config 

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
" Fuzzy finder
Plug 'kien/ctrlp.vim'
" cool bars
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" colors
Plug 'altercation/vim-colors-solarized'
" class/module browser
Plug 'majutsushi/tagbar'
" Zen coding
Plug 'mattn/emmet-vim'
" Autocompletion
Plug 'AutoComplPop'
" Search results counter
Plug 'IndexedSearch'
" XML/HTML tags navigation
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
call plug#end()

set background=dark
colorscheme solarized
" tunning powerline
"
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg = "dark"
let g:airline_theme = "solarized"

" jedi-vim annoying signature issue

set cmdheight=1
set encoding=utf-8
set termencoding=utf-8
set clipboard=unnamed
set mouse=a
set shortmess+=aI
set showmode
set showcmd
set modeline
set acd
set incsearch
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set numberwidth=3
set textwidth=79
set ruler

set splitbelow
set nobackup

" Status line
set wildchar=<tab>
set wildmenu
set wildmode=longest:full,full

set laststatus=2
set statusline=%-3.3n\ %f\ %r%#Error#%m%#Statusline#\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ 
set nohlsearch
set ignorecase
set smartcase
set showmatch

if v:version >= 700
    try
        setlocal numberwidth=3
    catch
    endtry
    " set cursorline
    set completeopt=menu,menuone,longest,preview
    set spelllang=en_us
    set spellsuggest=fast,20
    set numberwidth=1
    " imma commnt with missspellings, use me tu tesst
    "
    hi Pmenu ctermbg=2 guibg=darkolivegreen
    hi PmenuSel ctermbg=0 guibg=black
endif

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

iab teh the
iab DATE <C-R>=strftime("%B %d, %Y (%A, %H:%Mh)")<CR>
iab maintainer # Maintainer: Angel Velasquez <angvp@archlinux.org> 

" {{{ OmniCpp settings
" Behave like a IDE that knows C++:
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e.

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
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

" C file specific options
au FileType c,cpp set cindent
au FileType c,cpp set formatoptions+=ro
au FileType c,cpp set makeprg=gcc\ -Wall\ -O2\ -o\ %<\ %

" HTML abbreviations
au FileType html,xhtml,php,eruby imap bbb <br />
au FileType html,xhtml,php,eruby imap aaa <a href=""><left><left>
au FileType html,xhtml,php,eruby imap iii <img src="" /><left><left><left><left>
au FileType html,xhtml,php,eruby imap ddd <div class=""><left><left>

" Python abbreviations
au FileType python iab putf8 # -*- coding: utf-8 -*-
au FileType python iab debug import pdb; pdb.set_trace()
au FileType python iab idebug import ipdb; ipdb.set_trace()

" MS Word document reading
au BufReadPre *.doc set ro
au BufReadPre *.doc set hlsearch!
au BufReadPost *.doc %!antiword "%"
inoremap <Nul> <C-x><C-o>

" Buffer handling
nnoremap <C-N> :bn!<CR>
nnoremap <C-P> :bp!<CR>
inoremap <C-x><C-f> <C-o>:e!<Space>
nnoremap <C-x><C-f> :e!<Space>
inoremap <C-x><C-s> <C-o>:w!<CR>
nnoremap <C-x><C-s> :w!<CR>
inoremap <C-x><C-n> <C-o>:bn!<CR>
inoremap <C-x><C-p> <C-o>:bp!<CR>

" Shorcuts for tabs
map <C-t> <esc>:tabnew<cr>
" change this to arrows
" Control PageUp/PageDown to switch between tabs
nmap    <ESC>[5^    <C-PageUp>
nmap    <ESC>[6^    <C-PageDown>
nnoremap <C-PageDown> :tabn<CR>
nnoremap <C-PageUp> :tabp<CR>

" Cuz I am too lazy
map q :confirm qa<CR>

" insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <C-e> ggVG
" Sometimes i press shift and W or Q doesn't nothing .. so let's remap them :D
cmap W w
cmap Q q

set fillchars+=stl:\ ,stlnc:\

highlight TrollStopper ctermbg = red guibg = #FF0000

" Turn on syntax highlighting by default (did I mention we don't need to
" download modes like in emacs? :-)
filetype plugin indent on
syntax on
