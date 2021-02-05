#!/bin/sh

# install docker package
sudo pacman --noconfirm -S docker

# grant vagrant user rights to run docker commands by accessing default daemon unix socket to access daemon API
sudo usermod -aG docker vagrant

echo
echo 'check status of docker units' 
echo '- neither should be running'
systemctl status docker.service docker.socket
echo
echo 'check status via list-unit-files docker*:'
systemctl list-unit-files docker*
echo

echo 'enable & start docker.socket activation'
echo '- not enabling nor starting docker.service'
# enable = start at boot, --now = start now too
sudo systemctl enable --now docker.socket 

echo
echo 'check status of docker units again:'
systemctl status docker.service docker.socket
echo 'check status via list-unit-files docker*:'
systemctl list-unit-files docker*
