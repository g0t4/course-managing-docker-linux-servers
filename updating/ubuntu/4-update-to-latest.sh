#!/usr/bin/env bash

# RECOMMEND: open separate tab to keep previous terminal output pre-update 
sudo apt-get update

# update to latest versions of docker (s/b 20.10.3+)
sudo apt-get install -y \
  docker-ce docker-ce-cli containerd.io

echo
sudo docker version

echo
echo explore state post-install
echo "docker image ls"
sudo docker image ls
echo "docker container ls"
echo docker container ls
  # compare uptimes of containers
  # you could mod this to use live restore
echo "docker volume ls"
sudo docker volume ls
# externally open sites:
  # http://192.168.33.10:9000
  # http://192.168.33.10:8900
  # http://192.168.33.10:8800