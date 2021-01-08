#!/bin/sh

sudo pacman --noconfirm -S \
  tree \
  jq \
  pacman-contrib

## NOTES

# pstree installed is great!

# pacman -Sh # help for options to -S (remote packages)
# find packages
# pacman -Ss tree # search remote repositories for string, "tree" in this case

## local packages
# what package owns a file
# pacman -Qo pstree
# /usr/bin/pstree is owned by psmisc 23.3-4
