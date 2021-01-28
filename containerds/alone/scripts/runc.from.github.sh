#!/bin/bash
#
# Install /bin/runc pre-built binary

# latest github release:
# https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc92
_VERSION="v1.0.0-rc92"

# download runc binary right into /bin as runc so it is in path
# thus making it discoverable by containerd
sudo wget \
  https://github.com/opencontainers/runc/releases/download/${_VERSION}/runc.amd64 \
  --output-document /bin/runc
sudo chmod +x /bin/runc
# static linked to https://github.com/seccomp/libseccomp





## Further learning about runc
#
# Challenge: use runc alone (strip away containerd):
# https://github.com/opencontainers/runc#using-runc
#
# Read the runtime-spec
# https://github.com/opencontainers/runtime-spec
# 
# see kata.from.github.sh for a challenge