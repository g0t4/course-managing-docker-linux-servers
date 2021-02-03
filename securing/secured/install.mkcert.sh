#!/bin/sh

# Find the latest release you want to use
# - https://github.com/FiloSottile/mkcert/releases

_VERSION='1.4.3'
sudo wget --quiet \
  -O mkcert \
  "https://github.com/FiloSottile/mkcert/releases/download/v${_VERSION}/mkcert-v${_VERSION}-linux-amd64" 
sudo chmod +x mkcert
sudo mv mkcert /usr/bin/.


# - consider using it for more than just docker, see its docs for more
  # - note: https://github.com/FiloSottile/mkcert#supported-root-stores