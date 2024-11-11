#!/usr/bin/env sh

sh ~/Scripts/startup/Startup.sh

# for status bar
~/Scripts/bar/bar_continue.sh &

# network manager
nm-applet --sm-disable &
