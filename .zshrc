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
alias grep="rg -p"
alias ssh="TERM=xterm-256color ssh"
alias music="/usr/bin/YoutubeMusic/YoutubeMusic"
# Python Development
WORKON_HOME=~/virtualenvs

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

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
GPG_TTY=$(tty)
export GPG_TTY
export EDITOR
export PAGER
export VISUAL
export NVM_DIR
unset GREP_OPTIONS
unsetopt CORRECT

# colors for ls
source $HOME/env/colors.sh

# check if OSX and get additional variables
[[ $(echo $(uname)) == "Darwin" ]] && source ~/env/osx.sh
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/key-bindings.zsh  ] && source /usr/share/fzf/key-bindings.zsh

# check virtualenvwrapper Arch
[ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh


# SPACESHIP PROMPT OPTIONS
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_PROMPT_SEPARATE_LINE=false

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
# prompt
autoload -Uz promptinit
promptinit

# zpython
alias pyclean='find . -type f -name "*.py[co]" -delete'
module_path=($module_path /usr/local/lib/zpython)


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# to use gnu getopt first
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
