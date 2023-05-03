#!/usr/bin/env sh

SLEEPTIME=120

while true
do
	nitrogen --set-zoom-fill --random ~/Backgrounds/slideshow --save
	sleep $SLEEPTIME
done

