#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# ./.screenlayout/current-desktop.sh
if [ "$(xrandr --listmonitors | head -n 1 | awk '/:/ {print $2}')" -gt 1 ]; then
  ./.screenlayout/temp-setup.sh
fi
xscreensaver -no-splash &
polkit-dumb-agent &
setxkbmap us altgr-intl
nm-applet &
conky &
eval `cat ~/.fehbg` &
xrdb -merge ~/.Xresources &
exec awesome
