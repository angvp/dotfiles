# Angel Velásquez <angvp[at]archlinux.org>
# Last Update: October 06, 2010 (Wednesday, 11:11h)  
# User prompt shamelessly ripped of from Eike Hein's and scast configs.
#
 
### Global configurations
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
 
### Bash options
shopt -s checkwinsize
shopt -s no_empty_cmd_completion
shopt -s dotglob
shopt -s cdspell
shopt -s extglob
shopt -s cmdhist
shopt -s promptvars
shopt -s cmdhist
shopt -s no_empty_cmd_completion
 
stty -ixoff
 
### Aliases
alias ls='ls --color=auto -hF'
alias update='sudo pacman -Syu'
alias ff="firefox"
alias cp="cp -ri"
alias rm="rm -i"
alias mv="mv -i"
alias cls="clear"
alias vi="vim"
alias v="TERM=xterm && vim" 

### Exports
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export PATH=$PATH:/usr/local/bin:$HOME:/usr/bin:$HOME/bin
export EDITOR="vim"
export VISUAL="vim"
export PAGER=most
export MANPAGER=most
export mail=~/.mail
export IGNOREEOF=3
#- OpenOffice Hax
export OOO_FORCE_DESKTOP=gnome

### Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'
export PS1="${BLUE}[${NORMAL}«${BBLUE}\u${BRED}@${BBLUE}\h\[\e[0m\] ${BBLUE}\w\[\e[0m\]${BLUE}$(/bin/ls | /bin/grep -m 1 total | /bin/sed 's/total //')\[\e[0m\]${NORMAL}»${BLUE}]${BGREEN}\\$ ${NORMAL}"
 
### Functions
# Thanks phrak for these.
 
x () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		unrar x $1  	;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
            *.xz)       tar tJf $1      ;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}  
function daemon() { sudo /etc/rc.d/$1 $2; } 
function mktar() { tar czf "${1%%/}.tar.gz" "${1%%/}/"; }
function mkmine() { sudo chown -R ${USER} ${1:-.}; }
function calc() { echo "$*" | bc; }
 
# Welcome message
cat ~/.banner 
#Calendar
cal

#Packager functions
#- Arch Linux Maintainance stuff
export PACKAGER="Angel Velasquez <angvp@archlinux.org>"
export ARCH_HASKELL="Angel Velasquez <angvp@archlinux.org>"

alias mktesting="upchr testing/a64 && mkchr testing/a64 && upchr testing/a32 && mkchr testing/a32"
alias mkstable="upchr stable/a64 && mkchr stable/a64 && upchr stable/a32 && mkchr stable/a32"

# Update the given chroot/all
function upchr() {
    if [ $1 = "all" ]; then
            echo -e '\e[1;32mUpdating the \e[1;31mstable32\e[1;32m chroot.\e[0m'
            linux32 sudo mkarchroot -u /opt/chroot/stable/a32/root/
            echo -e '\e[1;32mUpdating the \e[1;31mtesting32\e[1;32m chroot.\e[0m'
            linux32 sudo mkarchroot -u /opt/chroot/testing/a32/root/
            echo -e '\e[1;32mUpdating the \e[1;31mstable64\e[1;32m chroot.\e[0m'
            sudo mkarchroot -u /opt/chroot/stable/a64/root/
            echo -e '\e[1;32mUpdating the \e[1;31mtesting64\e[1;32m chroot.\e[0m'
            sudo mkarchroot -u /opt/chroot/testing/a64/root/ 
    elif [ ! $1 = "" ]; then
            echo -e '\e[1;32mUpdating the \e[1;31m'$1'\e[1;32m chroot.\e[0m'
            if [ $1 = 'a32' ]; then
                    linux32 sudo mkarchroot -u /opt/chroot/stable/a32/root/
            elif [ $1 = 't32' ]; then
                    linux32 sudo mkarchroot -u /opt/chroot/testing/a32/root/
            else
                    sudo mkarchroot -u /opt/chroots/$1/root/
            fi
    fi
}

# Build the package with the given chroot
function mkchr() {
    if [ ! $1 = "" ]; then
            echo -e '\e[1;32mBuilding package using the \e[1;31m'$1'\e[1;32m chroot.\e[0m'
            if [ $1 = 'a32' ]; then
                    linux32 sudo makechrootpkg -c -r /opt/chroot/stable/$1/
            elif [ $1 = 't32' ]; then
                    linux32 sudo makechrootpkg -c -r /opt/chroot/testing/$1/
            else
                    sudo makechrootpkg -c -r /opt/chroot/stable/$1/
            fi
    fi
}

# Create a set of stable chroots for both architectures
function create_stable_chroots () {
    sudo mkdir -p /opt/chroot/stable/{a32,a64}
    # 64 Bit Chroot
    sudo mkarchroot /opt/chroot/stable/a64/root base base-devel sudo
    sudo $EDITOR /opt/chroot/stable/a64/root/etc/pacman.d/mirrorlist
    # 32 Bit Chroot
    sed -e 's@/etc/pacman.d/mirrorlist@/tmp/mirrorlist@g' /opt/chroot/stable/a64/root/etc/pacman.conf > /tmp/pacman.conf
    sudo linux32 mkarchroot /opt/chroot/stable/a32/root base base-devel sudo
    echo "Created a32 and a64 under /opt/chroot/stable/"
}

# Create a set of testing chroots for both architectures
function create_testing_chroots () {
    sudo mkdir -p /opt/chroot/testing/{a32,a64} 
    # 64 Bit Chroot
    sudo mkarchroot /opt/chroot/testing/a64/root base base-devel sudo
    sudo $EDITOR /opt/chroot/testing/a64/root/etc/pacman.conf
    sudo $EDITOR /opt/chroot/testing/a64/root/etc/pacman.d/mirrorlist
    # 32 Bit Chroot
    sed -e 's@/etc/pacman.d/mirrorlist@/tmp/mirrorlist@g' /opt/chroot/testing/a64/root/etc/pacman.conf > /tmp/pacman.conf
    sudo linux32 mkarchroot /opt/chroot/testing/a32/root base base-devel sudo
    sudo $EDITOR /opt/chroot/testing/a32/root/etc/pacman.conf
    sudo $EDITOR /opt/chroot/testing/a32/root/etc/pacman.d/mirrorlist
    echo "Created testing32 and testing64 under /opt/chroot/testing/"
}

function create_ff32_chroot() {
    sudo mkdir -p /opt/chroot/misc/firefox32
    sed -e 's@/etc/pacman.d/mirrorlist@/tmp/mirrorlist@g' /etc/pacman.conf > /tmp/pacman.conf
    sudo linux32 mkarchroot /opt/chroot/misc/firefox32/root base base-devel sudo firefox flashplayer 

}

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

