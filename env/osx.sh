alias launch-redis="redis-server /usr/local/etc/redis.conf"

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

test -e "${HOME}/env/osx.priv.sh" && source "${HOME}/env/osxpriv.sh"
export HOMEBREW_GITHUB_API_TOKEN

# virtualenvwrapper
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
