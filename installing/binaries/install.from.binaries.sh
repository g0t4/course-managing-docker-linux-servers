#!/bin/sh


VERSION="20.10.2"
ARCH="x86_64"
CHANNEL="stable"

# download binaries
curl -fsSL \
  "https://download.docker.com/linux/static/${CHANNEL}/${ARCH}/docker-${VERSION}.tgz" \
  -o "docker-${VERSION}.tgz"

# extract binaries
tar xzvf "docker-${VERSION}.tgz"

# UPDATE advice: perhaps diff old and new packages!

# copy or link binaries into directory in path already
# or modify path to include binaries folder
sudo cp docker/* /usr/bin/

# add a docker group and assign vagrant user membership
sudo addgroup --system docker
sudo adduser vagrant docker

# start dockerd by hand:
# sudo dockerd &
# sudo dockerd -H tcp:// # listen on default port 2375
# - options can be added
#   - as CLI args
#   - or as env vars
#   - or add options to a deamon.json config file:
#     - /etc/docker/daemon.json

# test a container
# sudo docker run --rm hello-world
