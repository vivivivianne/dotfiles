#!/bin/bash

# Will overwrite your local configs, make sure to back them up first!

git clone --bare https://github.com/vivivivianne/dotfiles $HOME/.cfg
git --git-dir="$HOME/.cfg/" --work-tree="$HOME" checkout -f
git --git-dir="$HOME/.cfg/" --work-tree="$HOME" config --local status.showUntrackedFiles no

# Downloading the needed packages (+ some extra stuff you might not use)
paru -S --needed $(echo ~/gitdotfiles/PC-Packages.txt)

chmod +x $HOME/gitdotfiles/scripts/*
chmod +x $XDG_CONFIG_HOME/wpg/fix-symlinks.sh
rm -rf $XDG_CONFIG_HOME/wpg/schemes/*
rm -rf $XDG_CONFIG_HOME/wpg/wallpapers/*

# Update WPGTK Symlinks, add WPGTK wallpapers, and generate a colorscheme
$XDG_CONFIG_HOME/wpg/fix-symlinks.sh
wpg -a $XDG_CONFIG_HOME/Wallpapers/*
wpg -A $(wpg -l)
