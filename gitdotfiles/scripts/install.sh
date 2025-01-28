#!/bin/bash

# Will overwrite your local configs, make sure to back them up first!

git clone --bare <git-repo-url> $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME"'
dotfiles checkout -f
dotfiles config --local status.showUntrackedFiles no

# Downloading the needed packages (+ some extra stuff you might not use)
paru -S --needed $(echo ~/gitdotfiles/PC-Packages.txt)

# Update WPGTK Symlinks, add WPGTK wallpapers, and generate a colorscheme
$XDG_CONFIG_HOME/wpg/fix-symlinks.sh
wpg -a $XDG_CONFIG_HOME/Wallpapers/*
wpg -A $(wpg -l)
