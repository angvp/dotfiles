#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
./.screenlayout/current-desktop.sh
xscreensaver -no-splash &
setxkbmap us altgr-intl
nm-applet &
conky &
eval `cat ~/.fehbg` &
xrdb -merge ~/.Xresources &
xinput --set-prop 15 'libinput Accel Speed' 1.0
# nvidia-settings --load-config-only &
start-pulseaudio-x11
exec awesome
