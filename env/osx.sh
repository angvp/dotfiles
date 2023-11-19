# Start keychain
if [ -f /usr/bin/keychain ] && [ "x$ssh_key" != "x" ]; then
    /usr/bin/keychain -q $ssh_key
    source $HOME/.keychain/$HOSTNAME-sh
fi

# iterm2 + zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

test -e "${HOME}/env/osxpriv.sh" && source "${HOME}/env/osxpriv.sh"
export HOMEBREW_GITHUB_API_TOKEN
