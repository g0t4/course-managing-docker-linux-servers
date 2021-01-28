#!/bin/bash

# https://containerd.io/downloads/
# WARNING: check for new containerd version and/or use stable build:
# _VERSION="1.4.3"
#
# latest version is in beta:
# https://github.com/containerd/containerd/releases/tag/v1.5.0-beta.0
_VERSION="1.5.0-beta.0"
__FILE="containerd-${_VERSION}-linux-amd64.tar.gz"
wget "https://github.com/containerd/containerd/releases/download/v${_VERSION}/${__FILE}"
tar xvf "${__FILE}"

# put binaries (containerd, ctr, ...) into path:
sudo cp bin/* /usr/bin
