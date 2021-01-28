#!/bin/bash
#
# Install kata-containers

# Challenge: get kata-containers to work with containerd.
# What are kata-containers?

# latest github release:
# https://github.com/kata-containers/kata-containers/releases/tag/2.0.1
_VERSION="v2.0.1"
sudo wget \
  https://github.com/kata-containers/kata-containers/releases/download/2.0.1/kata-static-2.0.1-x86_64.tar.xz
