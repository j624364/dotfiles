#!/usr/bin/env bash

sudo pacman -Sy archlinux-keyring --noconfirm && \
  sudo pacman-key --populate archlinux && \
  sudo pacman-key --refresh-keys && \
  sudo pacman --overwrite "*" -S npm && \
  sudo pacman -Syu --noconfirm
  #yay -Syu --noconfirm

