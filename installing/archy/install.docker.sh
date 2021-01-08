#!/bin/sh

# Sync package list and upgrade all packages
sudo pacman --noconfirm -Syu 

# Install (sync) docker package
sudo pacman --noconfirm -S docker  

# check status (say if testing script step by step)
# systemctl status docker.service docker.socket
# systemctl list-unit-files docker*

# grant vagrant user rights to run docker commands
# - add vagrant to docker group 
sudo usermod -aG docker vagrant

# enable = start at boot, --now = start now too
sudo systemctl enable --now docker

# test if vagrant user has access!
docker version
