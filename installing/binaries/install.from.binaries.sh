#!/bin/sh

# https://docs.docker.com/engine/install/#other-linux-distributions
# - last suggested route to take for unsuported distros
# https://docs.docker.com/engine/install/binaries/
# - statically linked and can be used on any Linux distribution
VERSION="20.10.2"
ARCH="x86_64"
CHANNEL="stable"

# download static linked binaries
curl -fsSL \
  "https://download.docker.com/linux/static/${CHANNEL}/${ARCH}/docker-${VERSION}.tgz" \
  -o "docker-${VERSION}.tgz"

# extract binaries
tar xzvf "docker-${VERSION}.tgz"

# copy or link binaries into directory in path already
# or modify path to include binaries folder
sudo cp docker/* /usr/bin/

# add vagrant user to docker group to access socket
sudo usermod -aG docker vagrant

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





