alias launch-redis="redis-server /usr/local/etc/redis.conf"
alias alacritty="open -n /Applications/Alacritty.app"

VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
PATH=$PATH:~/Library/Android/sdk/platform-tools

if [ -f /usr/local/bin/virtualenvwrapper.sh ] ; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/virtualenvwrapper.sh ] ; then
    source /usr/bin/virtualenvwrapper.sh
fi

# Start keychain
if [ -f /usr/bin/keychain ] && [ "x$ssh_key" != "x" ]; then
    /usr/bin/keychain -q $ssh_key
    source $HOME/.keychain/$HOSTNAME-sh
fi

# iterm2 + zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

test -e "${HOME}/env/osxpriv.sh" && source "${HOME}/env/osxpriv.sh"
export HOMEBREW_GITHUB_API_TOKEN

export ANDROID_HOME="/Users/angvp/Library/Android/sdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home/"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"

# virtualenvwrapper
eval "$(pyenv init -)"
