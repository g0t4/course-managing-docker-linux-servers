#!/bin/bash

# From: https://containerd.io/downloads/
# _VERSION="1.4.3"
_VERSION="1.5.0-beta.0"
_FILE="containerd-${_VERSION}-linux-amd64.tar.gz"
wget "https://github.com/containerd/containerd/releases/download/v${_VERSION}/${_FILE}"
tar xvf "${_FILE}"