TERM=kitty

if [ -f ~/.banner ] ; then
    ~/.banner
fi

# Arch Linux Packager functions
signpkg() {
    for pkg in *.pkg.tar.xz; do gpg --detach-sign $pkg; done
}
