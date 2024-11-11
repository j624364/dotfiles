#!/usr/bin/env bash

echo

echo -n ""
~/.config/i3/scripts/disk | firstline

echo " "

echo -n ""
~/.config/i3/scripts/memory

echo -n ""
echo "$(LANG=C nmcli d | grep connected  | awk '{print $4}')"

~/Scripts/bar/BatteryCapacity.py

~/.config/i3/scripts/volume

echo "::"

date '+%a %d %b %H:%M:%S'

