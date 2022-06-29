#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# ./.screenlayout/current-desktop.sh
./.screenlayout/temp-setup.sh
xscreensaver -no-splash &
setxkbmap us altgr-intl
nm-applet &
conky &
eval `cat ~/.fehbg` &
xrdb -merge ~/.Xresources &
exec awesome
