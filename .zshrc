#Angel Velásquez <angvp[at]archlinux.org>
#
# Last update: mayo 03, 2012 (jueves, 11:38h) 
# First i've tried to move some of my bash stuff to zsh then I copied sort of
# stuff from people from #archlinux-tu.
#
# Thanks to Bluewind, jelly1 and CryptoCrack for let me see their configs .


# Aliases
alias ls='ls --color=auto -hF'
alias cp="cp -ri"
alias rm="rm -i"
alias mv="mv -i"
alias cls="clear"
alias vi="vim"
alias ll="ls -la"
#alias ssh="mosh"

#zsh options

# prompt
# see my theme on .oh-my-zsh/themes/angvp.theme

## some better colors for ls
eval "`dircolors ~/.dircolors`"

#keybindings

# Development
WORKON_HOME=~/virtualenvs
source /usr/bin/virtualenvwrapper.sh 

perlvirtualenv() { source ~/perl5/perlbrew/etc/zshrc }
#functions
autoload -U zmv

rmspaces () {
    zmv '* *' '$f:gs/ /_'
}

lowerfiles() {
    zmv '(*)' '${(L)1}'
}

vc() { # list content of archive but don't unpack
    if [ -f "$1" ]; then
         case "$1" in
       *.tar.bz2|*.tbz2|*.tbz)  tar -jtf "$1"     ;;
       *.tar.gz)                tar -ztf "$1"     ;;
       *.tar|*.tgz|*.tar.xz)    tar -tf  "$1"     ;;
       *.gz)                    gzip -l  "$1"     ;;    
       *.rar)                   rar vb   "$1"     ;;
       *.zip)                   unzip -l "$1"     ;;
       *.7z)                    7z l     "$1"     ;;
       *.lzo)                   lzop -l  "$1"     ;;  
       *.xz|*.txz|*.lzma|*.tlz) xz -l    "$1"     ;;
         esac
    else
        echo "Sorry, '$1' is not a valid archive.\nValid archive types are: \ntar.bz2, tar.gz, tar.xz, tar, gz, \ntbz2, tbz, tgz, lzo, rar \nzip, 7z, xz and lzma\n"
    fi
}

x() { # decompress an archive 
   if [ -f "$1" ] ; then
       case "$1" in
       *.tar.bz2|*.tgz|*.tbz2|*.tbz) tar xvjf   "$1"  ;;
       *.tar.gz)                     tar xvzf   "$1"  ;;
       *.tar.xz)                     tar xvJf   "$1"  ;;
       *.tar)                        tar xvf    "$1"  ;;
       *.rar)                        7z x       "$1"  ;;
       *.zip)                        unzip      "$1"  ;;
       *.7z)                         7z x       "$1"  ;;
       *.lzo)                        lzop -d    "$1"  ;;  
       *.gz)                         gunzip     "$1"  ;;
       *.bz2)                        bunzip2    "$1"  ;;
       *.Z)                          uncompress "$1"  ;;
       *.xz|*.txz|*.lzma|*.tlz)      xz -d      "$1"  ;; 
       *)               
       esac
   else
        echo "Sorry, '$1' is not a valid archive.\nValid archive types are: \ntar.bz2, tar.gz, tar.xz, tar, gz, \ntbz2, tbz, tgz, lzo, rar \nzip, 7z, xz and lzma\n"
   fi
}

if [ -f .banner ] ; then
    ./.banner
fi
cal
#Packager functions
#- Arch Linux Maintainance stuff
PACKAGER="Angel Velasquez <angvp@archlinux.org>"
ARCH_HASKELL="Angel Velasquez <angvp@archlinux.org>"

signpkg() {
    for pkg in *.pkg.tar.xz; do gpg --detach-sign $pkg; done
}

delswp() {
    find . -name "*.swp" -delete
}

# Let's load some aliases to work
#source ~/work.zshrc

# oh my zsh stuff

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="angvp"

plugins=(zsh-syntax-highlighting git git-extras python systemd django)
source $ZSH/oh-my-zsh.sh

unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true"

bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward
bindkey "\e[7~" beginning-of-line # Home 
bindkey "\e[8~" end-of-line # End

# Exports
## history stuff
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
## path
export GOPATH=~/go
PATH=$PATH:/usr/local/bin:/usr/bin:$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:$GOPATH/bin
#other stuff
GTK2_RC_FILES=$HOME/.gtkrc-2.0
#editor
EDITOR="vim"
VISUAL="vim"
PAGER="most"
MANPAGER="most"
mail=~/.mail
IGNOREEOF=3
GPG_TTY=$(tty)
export GPG_TTY
export EDITOR
export PAGER
export VISUAL
unset GREP_OPTIONS

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#some work stuff

#source /usr/share/zsh/site-contrib/powerline.zsh
#export PULSE_LATENCY_MSEC=60
#
#

	
# Start keychain
if [ -f /usr/bin/keychain ] && [ "x$ssh_key" != "x" ]; then
	/usr/bin/keychain -q $ssh_key
	source $HOME/.keychain/$HOSTNAME-sh
fi
