#!/usr/bin/env sh

sh ~/Scripts/Startup.sh

# for status bar
~/Scripts/bar_continue.sh &

# network manager
nm-applet --sm-disable &
