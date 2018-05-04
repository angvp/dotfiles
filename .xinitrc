#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
./.screenlayout/twomonitors2.sh
xscreensaver -no-splash &
setxkbmap us altgr-intl
nm-applet &
conky &
eval `cat ~/.fehbg` &
xrdb -merge ~/.Xresources &
nvidia-settings --load-config-only &
start-pulseaudio-x11
exec awesome
