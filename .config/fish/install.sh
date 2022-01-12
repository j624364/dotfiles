#!/bin/bash

sudo pacman -S fish

if [ $? -eq 0 ]
then
	chsh -s /bin/fish
fi

exit $?

