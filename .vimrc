" angvp's .vimrc config 
" I completely rip off everything from scast rezza and phrakture configs, then
" I decided to remove unuseful stuff and add new features

"Fkeys are:
" F3: hlsearch / nohlsearch 
" F5 / F6: compile / run (according filetype) 
" F7:python help  
" F8: NerdTree Open / Close 
" F10: pastetoggle
"
colorscheme wombat
set cmdheight=1
set encoding=utf-8
set termencoding=utf-8
set clipboard=unnamed
set mouse=a
set nocompatible
set shortmess+=aI
set showmode
set showcmd
set modeline
set wildmenu
set background=dark
set acd
set incsearch
set softtabstop=4
set shiftwidth=4
set numberwidth=3
set textwidth=79
set ruler
set termencoding=utf-8
set guifont=Monaco\ 11

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
    " set cursorline
    set completeopt=menu,menuone,longest,preview
    set spelllang=en_us
    set spellsuggest=fast,20
    set numberwidth=1
    " imma commnt with missspellings, use me tu tesst
endif

set whichwrap=h,l,<,>,[,]
set backspace=indent,eol,start
set tabstop=4
set expandtab
set nowrap
set history=500
set autoindent
set smartindent
set shiftround

set number
if v:version >= 700
        try
                setlocal numberwidth=3
        catch
        endtry
"   Uncomment next line to have a cursorline so you know on what line are you. Be careful, 
"   this makes screen redrawing very slow. 

"    set cursorline
    set completeopt=menu,menuone,longest,preview
    set numberwidth=1
    hi Pmenu ctermbg=2 guibg=darkolivegreen
    hi PmenuSel ctermbg=0 guibg=black
endif


set formatoptions+=nl
set selection=inclusive
set pastetoggle=<F10>


if has("folding")
    set foldenable
    set foldmethod=marker
    set foldlevel=100
endif

let html_use_css=1
" Change the <Leader> key here. By default it's ` but you can change for
" everything you want.
" let mapleader="`" 

" Spellchecking
" I don't know how this works, you can try to fix it and email me with your
" solution. Sorry.

" setlocal spell spelllang=en_us

iab teh the
iab DATE <C-R>=strftime("%B %d, %Y (%A, %H:%Mh)")<CR>
iab maintainer # Maintainer: Angel Velasquez <angvp@archlinux.org> 

" {{{ OmniCpp settings
" Behaive like a IDE that knows C++:
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" set completeopt=menu,menuone

let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e.


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

" Compile and run keymappings
au FileType c,cpp map <F5> :!./%:r<CR>
au FileType sh,php,python,ruby map <F5> :!./%<CR>
au FileType perl map <F5> :!perl -cw %<CR>
au FileType c,cpp map <F6> :make<CR>
au FileType php map <F6> :!php &<CR>
au FileType python map <F6> :!python %<CR>
au FileType perl map <F6> :!perl %<CR>
au FileType ruby map <F6> :!ruby %<CR>
au FileType html,xhtml map <F5> :!firefox %<CR>

" MS Word document reading
au BufReadPre *.doc set ro
au BufReadPre *.doc set hlsearch!
au BufReadPost *.doc %!antiword "%"
inoremap <Nul> <C-x><C-o>

" Help keybindings
nnoremap <F1> :help<Space>
map <F7> :!python -c 'help()'<left><left>

" Search bindings
noremap <F4> :set hlsearch! hlsearch?<CR>

" NERDTree Bindings
map <F8> :NERDTreeToggle <CR>

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
" Control PageUp/PageDown to switch between tabs
nmap    <ESC>[5^    <C-PageUp>
nmap    <ESC>[6^    <C-PageDown>
nnoremap <C-PageDown> :tabn<CR>
nnoremap <C-PageUp> :tabp<CR>

" Cuz I am too lazy
map q :confirm qa<CR>

" Frames or whatever they are called.
" There are probably better ways to set a keybinding for both, insert and normal modes,
" I am just stupid (and apparently a thief too).
inoremap <M-/> <C-x><C-o>
inoremap <C-x>2 <C-o><C-w>s
nnoremap <C-x>2 <C-w>s
inoremap <C-x>3 <C-o><C-w>v
nnoremap <C-x>3 <C-w>v
inoremap <C-x>0 <C-o><C-w>c
nnoremap <C-x>0 <C-w>c
inoremap <C-x>1 <C-o><C-w>o
nnoremap <C-x>1 <C-w>o
inoremap <C-x>o <C-o><C-w>w
nnoremap <C-x>o <C-w>w 
inoremap <C-x><C-o> <C-o><C-w>w
nnoremap <C-x><C-o> <C-w>w
inoremap <M-x> <C-o>:
nnoremap <M-x> :
vnoremap <M-w> "ly
vnoremap <Backspace> x
inoremap <C-x>u <C-o>u
nnoremap <C-x>u u
inoremap <C-x>w <C-o>x
nnoremap <C-x>w <C-o>x
vnoremap <C-x>w x
inoremap <A-o> <C-o>o
nnoremap <A-o> <C-o>o

" insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" Set up the status line
nnoremap <C-e> ggVG

" Turn on syntax highlighting by default (did I mention we don't need to
" download modes like in emacs? :-)
syntax on
