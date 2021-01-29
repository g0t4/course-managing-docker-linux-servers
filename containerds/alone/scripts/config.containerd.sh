#!/bin/bash

sudo mkdir -p /etc/containerd/

# write out config file using heredoc
cat <<-EOF | sudo tee /etc/containerd/config.toml

[grpc]
# vagrant gid is 1000
gid = 1000

EOF









## NOTES

# FYI sudo calls are so it is easy to pick up and drop in at the command line to test these by hand even though the vagrant shell provisioner by default elevates permissions.
