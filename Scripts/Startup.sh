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

# from i3
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
dex --autostart --environment i3

