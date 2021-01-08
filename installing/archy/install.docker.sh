#!/bin/sh

# Install docker package
sudo pacman --noconfirm -S docker
# check status (say if testing script step by step)
# systemctl status docker.service docker.socket
# neither unit should be active post install
# summary of state: `systemctl list-unit-files docker*`

# grant vagrant user rights to run docker commands
sudo usermod -aG docker vagrant

# enable = start at boot, --now = start now too
sudo systemctl enable --now docker.socket 
  # only enable socket activation on boot

# test if vagrant user has access!
docker version
