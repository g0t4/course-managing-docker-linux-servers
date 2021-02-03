#!/bin/sh

# first run, notice certificate is generated
echo "\n before first run:"
ls X

mkcert

echo "\n after first run:"
ls X

# display location of root CA key and cert:
mkcert -CAROOT

# actually, you can manage multiple root CAs by changing env var `$CAROOT`
# and upon running `mkcert` it will generate key & cert if that location is empty.
# how about generate them into the vagrant synced folder to access them from your host!

_CERT_PATH="/vagrant/certy"
rm -rf ${_CERT_PATH}
mkdir -p ${_CERT_PATH}

export CAROOT="/vagrant"
# verify env var
mkcert -CAROOT
# gen root CAs
ls /vagrant
mkcert
ls /vagrant

# generate server cert
# mkcert
# generate client cert
# mkcert

## OTHER SYSTEMS
# just copy root CA's certificate to other systems so they can `trust` remote services
# https://github.com/FiloSottile/mkcert#installing-the-ca-on-other-systems
