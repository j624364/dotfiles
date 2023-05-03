#!/bin/bash

# startup apps

# compositor
picom &

# wallpapers
nitrogen --restore &

~/Scripts/wallpaper_slideshow.sh &

# notifications
dbus-launch dunst --config ~/.config/dunst/dunstrc &

# settings

# load uk keyboard layout
setxkbmap gb

# keybind settings
numlockx on

setxkbmap -option caps:escape

sxhkd &

# turn wifi on
nmcli radio wifi on

# emacs daemon
emacs --daemon --with-x-toolkit=lucid &
