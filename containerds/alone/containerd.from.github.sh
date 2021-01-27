#!/bin/bash

# https://containerd.io/downloads/
# _VERSION="1.4.3"
# https://github.com/containerd/containerd/releases/tag/v1.5.0-beta.0
_VERSION="1.5.0-beta.0"
__FILE="containerd-${_VERSION}-linux-amd64.tar.gz"
wget "https://github.com/containerd/containerd/releases/download/v${_VERSION}/${__FILE}"
tar xvf "${__FILE}"
sudo cp bin/* /usr/bin
