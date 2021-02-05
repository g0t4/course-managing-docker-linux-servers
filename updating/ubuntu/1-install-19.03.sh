#!/usr/bin/env bash

# Adapted from https://docs.docker.com/engine/install/ubuntu/

# https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions
sudo apt-get remove -y \
  docker docker-engine docker.io containerd runc

# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
sudo apt-get update
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

# FYI in ubuntu/groovy64 (20.10) apt-key is deprecated
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update 
# FYI you can list and pick a specific version:
apt-cache madison docker-ce
# at time of recording
# 20.10
  # 5:20.10.1~3-0~ubuntu-focal
  # 5:20.10.0~3-0~ubuntu-focal
# 19.03
  # 5:19.03.14~3-0~ubuntu-focal
  # 5:19.03.13~3-0~ubuntu-focal
  # 5:19.03.12~3-0~ubuntu-focal
  # 5:19.03.11~3-0~ubuntu-focal
  # 5:19.03.10~3-0~ubuntu-focal
  # 5:19.03.9~3-0~ubuntu-focal
_version="5:19.03.14~3-0~ubuntu-focal"
sudo apt-get install -y \
  docker-ce=${_version} \
  docker-ce-cli=${_version} \
  containerd.io


echo "\n Step 1 docker version:"
sudo docker version
echo


echo
echo "Congrats you auto provisioned (installed) an older version of Docker for simulating updates, on to step 2..."
