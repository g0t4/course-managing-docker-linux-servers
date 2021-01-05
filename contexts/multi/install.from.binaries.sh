#!/bin/sh

# https://docs.docker.com/engine/install/#other-linux-distributions
# - last suggested route to take for unsuported distros
# https://docs.docker.com/engine/install/binaries/
# - statically linked and can be used on any Linux distribution
VERSION="20.10.2"
ARCH="x86_64"
CHANNEL="stable"
curl -fsSL \
  "https://download.docker.com/linux/static/${CHANNEL}/${ARCH}/docker-${VERSION}.tgz" \
  -o "sdocker-${VERSION}.tgz"

log_info() {
  echo "INFO: $@"
}

