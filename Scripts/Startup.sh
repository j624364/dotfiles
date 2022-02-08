#!/bin/bash

# startup apps

# compositor
# picom &

# network manager
nm-applet &

# wallpapers
nitrogen --restore &

# notifications
dbus-launch dunst --config ~/.config/dunst/dunstrc &

# settings

# load uk keyboard layout
setxkbmap gb

# turn numlock on
numlockx on

