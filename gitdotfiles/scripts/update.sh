#!/bin/bash

#fetch new stuff, discard local changes, update
git --git-dir="/$HOME/.cfg/" --work-tree="$HOME" stash && git --git-dir="/$HOME/.cfg/" --work-tree="$HOME" pull && git --git-dir="/$HOME/.cfg/" --work-tree="$HOME" stash drop
chmod +x $HOME/gitdotfiles/scripts/*
chmod +x $XDG_CONFIG_HOME/wpg/fix-symlinks.sh
rm -rf $XDG_CONFIG_HOME/wpg/schemes/*
rm -rf $XDG_CONFIG_HOME/wpg/wallpapers/*
rm -rf $XDG_CONFIG_HOME/Wallpapers/*.gif.wal_sample.png

# Update WPGTK Symlinks, add WPGTK wallpapers, and generate a colorscheme
$XDG_CONFIG_HOME/wpg/fix-symlinks.sh
wpg -a $XDG_CONFIG_HOME/Wallpapers/*
wpg -A $(wpg -l)

