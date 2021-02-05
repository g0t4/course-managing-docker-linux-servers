#!/usr/bin/env bash

sudo apt-get update 

_version="5:20.10.0~3-0~ubuntu-focal"
sudo apt-get install -y \
  docker-ce=${_version} \
  docker-ce-cli=${_version} \
  containerd.io

echo "\n Step 2 docker version:"
sudo docker version
echo