#!/bin/sh

# Sync package list and upgrade all packages
sudo pacman --noconfirm -Syu 

# REBOOT AFTER THIS:
# https://wiki.archlinux.org/index.php/System_maintenance#Restart_or_reboot_after_upgrades

# - https://wiki.archlinux.org/index.php/Pacman#Upgrading_packages