" angvp's .vimrc config
" =====================

let mapleader = " "
let maplocalleader = " "
set nocompatible
"" plugin installer
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" cool bars
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" colors
Plug 'altercation/vim-colors-solarized'
" class/module browser (to be removed?)
Plug 'majutsushi/tagbar'
" Zen coding
Plug 'mattn/emmet-vim'
" Autocompletion
Plug 'Shougo/neocomplcache.vim'
" Plug 'maralla/completor.vim' " TODO: try this later
" Indexed Search (better search integration)
Plug 'vim-scripts/IndexedSearch'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" asynchronous lint engine
Plug 'w0rp/ale'
" Isort plugin
Plug 'fisadev/vim-isort'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'ryanoasis/vim-devicons'


" Virtualenv
Plug 'jmcantrell/vim-virtualenv'
" vim troll stopper
Plug 'vim-utils/vim-troll-stopper'
" python-mode (debugger and python stuff)
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Fugitive
Plug 'tpope/vim-fugitive'
" window chooser
Plug 't9md/vim-choosewin'
" javascript
Plug 'pangloss/vim-javascript'
" javascript (might be removed, still testing it)
Plug 'jelera/vim-javascript-syntax'
" jsx (react)
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'mxw/vim-jsx'
" whitespace
Plug 'ntpeters/vim-better-whitespace'
" base16 solarized
function FixupBase16(info)
    !sed -i '/Base16hi/\! s/a:\(attr\|guisp\)/l:\1/g' ~/.vim/plugged/base16-vim/colors/*.vim
endfunction
Plug 'chriskempson/base16-vim', { 'do': function('FixupBase16') }
" splitjoin
Plug 'AndrewRadev/splitjoin.vim'
" brackets
Plug 'itmammoth/doorboy.vim'
" if !has('mac')
"   Plug 'sebmaynard/vim-ligatures'
" endif
Plug 'editorconfig/editorconfig-vim'
" formatting php
" Plug 'beanworks/vim-phpfmt'
Plug 'vuciv/vim-bujo'

call plug#end()

if vim_plug_just_installed
    :PlugInstall
endif

" colors
let g:solarized_visibility =  "low"
if (vim_plug_just_installed)
    "colorscheme delek
else
    colorscheme base16-solarized-dark
endif
" colors -> powerline options
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg = "dark"
let g:airline_theme = "base16_solarized"
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
au BufNewFile,BufRead *.j2 set filetype=jinja
au BufNewFile,BufRead *.sls set filetype=yaml
au BufNewFile,BufRead *.sass set filetype=sass

" Templates TIL thanks to this tweet
" (https://twitter.com/csswizardry/status/903244333687721988)
au BufNewFile *.test.js 0r ~/.vimtpl/template.test.js

" C file specific options
au FileType c,cpp set cindent
au FileType c,cpp set formatoptions+=ro
au FileType c,cpp set makeprg=gcc\ -Wall\ -O2\ -o\ %<\ %

" Python abbreviations
au FileType python iab putf8 # -*- coding: utf-8 -*-
au FileType python setlocal et ts=4 sw=4 sts=4
au FileType jinja setlocal et ts=4 sw=4 sts=4
" JavaScript abbreviations
au FileType javascript setlocal et ts=2 sw=2 sts=2
au FileType json setlocal et ts=2 sw=2 sts=2
au FileType jsx setlocal et ts=2 sw=2 sts=2
au FileType sass setlocal noexpandtab

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
set rtp+=/usr/local/opt/fzf
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

let g:black_linelength = 79
" ale options
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" it requires you install prettier-standard
" yarn add --dev prettier-standard
let g:ale_fixers = {'javascript': ['prettier_standard'], 'python': ['black', 'yapf', 'isort']}
let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 0

" Python-mode options
let g:pymode_lint_on_write = 1
let g:pymode_lint_signs = 0
let g:pymode_folding = 0
let g:pymode_rope = 1
let pymode_breakpoint = 1
let pymode_breakpoint_bind = 'b'
let pymode_doc = 1
let pymode_doc_bind = 'K'
let pymode_folding = 1
let pymode_indent = 1
let pymode_lint_cwindow = 1
let pymode_lint_ignore = ''
let pymode_lint_message = 1
let pymode_lint_on_fly = 0
let pymode_lint_select = ''
let pymode_motion = 1
let pymode_options = 1
let pymode_paths = []
let pymode_quickfix_maxheight = 6
let pymode_quickfix_minheight = 3
let pymode_rope = 1
let pymode_run = 1
let pymode_run_bind = '<F5>'
let pymode_trim_whitespaces = 1
let pymode_virtualenv = 1
let pymode_virtualenv_enabled = ''
let pymode_lint = 1
let g:pymode_python = 'python3'
" choosewin
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" phpfmt
" let g:phpfmt_standard = 'PSR2'

" whitespace configuration
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:
" set list
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59

set timeoutlen=1000 ttimeoutlen=0
syntax on
