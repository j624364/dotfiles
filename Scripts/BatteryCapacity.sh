#!/usr/bin/env bash

battery_status=$(</sys/class/power_supply/BAT1/status)
percent=$(</sys/class/power_supply/BAT1/capacity)

symbol=
prefix=

if [ $battery_status = "discharging" ]
then
	$prefix=''
elif [ $battery_status = "charging" ]
then
	$prefix=''
fi

if [ $percent -eq 100 ]
then
  label=''
elif [ $percent -gt 75 ]
then
  label=''
elif [ $percent -gt 50 ]
then
  label=''
elif [ $percent -gt 25 ]
then
  label=''
else
  label=''
fi

#if ($percent < 20) {
  #$label = '';
#} elsif ($percent < 45) {
  #$label = '';
#} elsif ($percent < 70) {
  #$label = '';
#} elsif ($percent < 95) {
  #$label = '';
#} else {
#}

echo $prefix $symbol %
