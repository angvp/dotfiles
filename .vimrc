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
" YAPF formatter for Python
Plug 'pignacio/vim-yapf-format'
" Virtualenv
Plug 'jmcantrell/vim-virtualenv'
" vim troll stopper
Plug 'vim-utils/vim-troll-stopper'
" python-mode (debugger and python stuff)
Plug 'klen/python-mode', {'branch': 'develop'}
" Fugitive
Plug 'tpope/vim-fugitive'
" window chooser
Plug 't9md/vim-choosewin'
" javascript
Plug 'pangloss/vim-javascript'
" jsx (react)
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'mxw/vim-jsx'
" whitespace
Plug 'ntpeters/vim-better-whitespace'
" base16 solarized
Plug 'chriskempson/base16-vim'
call plug#end()

if vim_plug_just_installed
    :PlugInstall
endif

" colors
set background=dark
let g:solarized_visibility =  "low"
if (vim_plug_just_installed)
    colorscheme delek
else
    " colorscheme solarized
    colorscheme base16-default-dark
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

" yapf
let g:yapf_format_yapf_location = '/usr/local/bin/yapf'

" ale options
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_linters = {
" \   'javascript': [],
" \}

"neocomplcache (stolen from fisadev/fisaconfig)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with words from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

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
let pymode_lint_checkers = ['flake8', 'mccabe']
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
let pymode_run_bind = 'r'
let pymode_trim_whitespaces = 1
let pymode_virtualenv = 1
let pymode_virtualenv_enabled = ''
let pymode_lint = 1
" choosewin
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" define python to be used
let g:python_host_prog = '/usr/local/bin/pypy'

" whitespace configuration
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space: 
" set list
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59

set timeoutlen=1000 ttimeoutlen=0
syntax on
