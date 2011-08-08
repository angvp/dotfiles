# Angel Velásquez <angvp[at]archlinux.org>
#
# Last Update: agosto 08, 2011 (lunes, 15:14h)   
# First i've tried to move some of my bash stuff to zsh then I copied sort of
# stuff from people from #archlinux-tu.
#
# Thanks to Bluewind, jelly1 and CryptoCrack for let me see their configs .
#

# Aliases
alias ls='ls --color=auto -hF'
alias update='sudo pacman -Syu'
alias ff="firefox"
alias cp="cp -ri"
alias rm="rm -i"
alias mv="mv -i"
alias cls="clear"
alias vi="vim"
alias v="TERM=xterm && vim" 
alias ll="ls -la"

# Server aliases
alias cuca="ssh avelasquez@cuca"
alias olmeca-devel="ssh movilgate@olmeca-devel"
alias chimango-devel="ssh avelazquez@chimango-devel"
alias chimango="ssh avelazquez@chimango"
alias bombo-virtual="ssh avelazquez@bombo-virtual" 
alias olmeca="ssh avelazquez@olmeca"
alias deimos="ssh avelasquez@deimos"


#zsh options

## Smart completion
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
# prompt
## some better colors for ls
eval "`dircolors ~/.dircolors`"

setprompt () {
        # load some modules
        autoload -U zsh/terminfo # Used in the colour alias below
        # Use colorized output, necessary for prompts and completions.
        autoload -U colors && colors
        setopt prompt_subst

        # make some aliases for the colours: (coud use normal escap.seq's too)
        for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
                eval PR_$color='%{$fg[${(L)color}]%}'
        done
        PR_NO_COLOR="%{$terminfo[sgr0]%}"

        # Check the UID
        if [[ $UID -ge 1000 ]]; then # normal user
                eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
                eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
        elif [[ $UID -eq 0 ]]; then # root
                eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
                eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
        fi      

        # Check if we are on SSH or not  --{FIXME}--  always goes to |no SSH|
        if [[ -z "$SSH_CLIENT"  ||  -z "$SSH2_CLIENT" ]]; then 
                eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
        else 
                eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
        fi
        if [[ -f /inchroot ]]; then
                eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
        fi
        # set the prompt
        PS1=$'${PR_CYAN}[${PR_USER}${PR_CYAN}@${PR_HOST}${PR_CYAN}][${PR_BLUE}%~${PR_CYAN}]${PR_USER_OP} '
        PS2=$'%_>'
}
setprompt

#keybindings

# URxvt keys
bindkey '[2~' overwrite-mode
bindkey '[3~' delete-char
bindkey '[7~' beginning-of-line
bindkey '[8~' end-of-line
bindkey '[5~' history-search-backward
bindkey '[6~' history-search-forward 

#functions
daemon() {
    sudo /etc/rc.d/$1 $2;
}

vc() { # list content of archive but don't unpack
    if [ -f "$1" ]; then
         case "$1" in
       *.tar.bz2|*.tbz2|*.tbz) tar -jtf "$1"     ;;
       *.tar.gz)                     tar -ztf "$1"     ;;
       *.tar|*.tgz|*.tar.xz)                 tar -tf "$1"     ;;
       *.gz)                 gzip -l "$1"     ;;    
       *.rar)                 rar vb "$1"     ;;
       *.zip)                 unzip -l "$1"     ;;
       *.7z)                 7z l "$1"     ;;
       *.lzo)                 lzop -l "$1"     ;;  
       *.xz|*.txz|*.lzma|*.tlz)      xz -l "$1"     ;;
         esac
    else
        echo "Sorry, '$1' is not a valid archive.\nValid archive types are: \ntar.bz2, tar.gz, tar.xz, tar, gz, \ntbz2, tbz, tgz, lzo, rar \nzip, 7z, xz and lzma\n"
    fi
}

x() { # decompress archive (to directory $2 if wished for and possible)
   if [ -f "$1" ] ; then
       case "$1" in
       *.tar.bz2|*.tgz|*.tbz2|*.tbz) mkdir -v "$2" 2>/dev/null ; tar xvjf "$1" -C "$2" ;;
       *.tar.gz)             mkdir -v "$2" 2>/dev/null ; tar xvzf "$1" -C "$2" ;;
       *.tar.xz)             mkdir -v "$2" 2>/dev/null ; tar xvJf "$1" ;;
       *.tar)             mkdir -v "$2" 2>/dev/null ; tar xvf "$1"  -C "$2" ;;
       *.rar)             mkdir -v "$2" 2>/dev/null ; 7z x   "$1"     "$2" ;;
       *.zip)             mkdir -v "$2" 2>/dev/null ; unzip   "$1"  -d "$2" ;;
       *.7z)             mkdir -v "$2" 2>/dev/null ; 7z x    "$1"   -o"$2" ;;
       *.lzo)             mkdir -v "$2" 2>/dev/null ; lzop -d "$1"   -p"$2" ;;  
       *.gz)             gunzip "$1"                       ;;
       *.bz2)             bunzip2 "$1"                       ;;
       *.Z)                 uncompress "$1"                       ;;
       *.xz|*.txz|*.lzma|*.tlz)     xz -d "$1"                           ;; 
       *)               
       esac
   else
        echo "Sorry, '$1' is not a valid archive.\nValid archive types are: \ntar.bz2, tar.gz, tar.xz, tar, gz, \ntbz2, tbz, tgz, lzo, rar \nzip, 7z, xz and lzma\n"
   fi
}
