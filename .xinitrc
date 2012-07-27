#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
xscreensaver -no-splash &
eval $(cat ~/.fehbg) & 
setxkbmap es &
conky &
wicd-client &
start-pulseaudio-x11 
ck-launch-session subtle 
