# angvp .zshrc (prezto required)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Aliases
if [ -f /usr/local/bin/gls ]; then
    alias gls="/usr/local/bin/gls"
    alias ls="gls --color=auto"
fi
alias cp="cp -ri"
alias rm="rm -i"
alias mv="mv -i"
alias cls="clear"
alias vi="vim"
alias ll="ls -la"
alias grep="grep --color=always"

alias launch-redis="redis-server /usr/local/etc/redis.conf"

# Python Development
WORKON_HOME=~/virtualenvs

# MacOSX homebrew path
if [ -f /usr/local/bin/virtualenvwrapper.sh ] ; then
    source /usr/local/bin/virtualenvwrapper.sh 
elif [ -f /usr/bin/virtualenvwrapper.sh ] ; then
    source /usr/bin/virtualenvwrapper.sh
fi

# Functions
autoload -U zmv

# replace spaces on filenames with underscores
rmspaces () {
    zmv '* *' '$f:gs/ /_'
}

# replace uppercase to lowercase
lowerfiles() {
    zmv '(*)' '${(L)1}'
}

# list contents of a compressed file but don't uncompress
vc() {
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

# uncompress any kind of compressed file
x() {
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

# TODO: This banner should go to .zshrc.archlinux
if [ -f .banner ] ; then
    ./.banner
fi

# Arch Linux Packager vars and functions
PACKAGER="Angel Velasquez <angvp@archlinux.org>"
ARCH_HASKELL="Angel Velasquez <angvp@archlinux.org>"

signpkg() {
    for pkg in *.pkg.tar.xz; do gpg --detach-sign $pkg; done
}

delswp() {
    find . -name "*.swp" -delete
}

# show calendar
cal

# Exports variables
## history stuff
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
## path
export GOPATH=~/go
PATH=$PATH:/usr/local/bin:/usr/bin:$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:$GOPATH/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin
## editor
EDITOR="vim"
VISUAL="vim"
PAGER="most"
MANPAGER="most"
mail=~/.mail
IGNOREEOF=3
# osx homebrew
HOMEBREW_GITHUB_API_TOKEN=fd8427c5d68eb9428d07ddcc6b8e0274173e2e6a
GPG_TTY=$(tty)
export GPG_TTY
export EDITOR
export PAGER
export VISUAL
export HOMEBREW_GITHUB_API_TOKEN
if [ -d /usr/local/Cellar/vim/7.4.2085/share/vim/vim74/ ]; then
    export VIM=/usr/local/Cellar/vim/7.4.2085/share/vim/vim74/
fi

unset GREP_OPTIONS
unsetopt CORRECT

# Start keychain
if [ -f /usr/bin/keychain ] && [ "x$ssh_key" != "x" ]; then
    /usr/bin/keychain -q $ssh_key
    source $HOME/.keychain/$HOSTNAME-sh
fi

# colors for ls
source $HOME/env/colors.sh
# alias ls='gls --color=auto'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm2 + zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# prompt 
autoload -Uz promptinit
promptinit
# prompt agnoster
