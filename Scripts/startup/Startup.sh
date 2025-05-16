#!/bin/bash

# startup apps

flameshot &

# compositor
picom &

# nightlight
redshift -l 53:-1.2 &

# wallpapers
nitrogen --restore &

# not rn with dracula
# ~/Scripts/wallpaper_slideshow.sh &

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
#emacs --daemon --with-x-toolkit=lucid &
