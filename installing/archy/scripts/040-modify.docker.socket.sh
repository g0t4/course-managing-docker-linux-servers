#!/bin/sh

# FYI edit manually with:
  # sudo systemctl edit docker.socket

docker_socket_d="/etc/systemd/system/docker.socket.d"
socket_override="${docker_socket_d}/override.conf"
sudo mkdir -p "${docker_socket_d}"
sudo tee "${socket_override}" <<EOF
[Socket]
# note: add in empty ListenStream directive to clear all previously defined sockets, otherwise this file is additive to the other sockets
# ListenStream=
ListenStream=0.0.0.0:2375
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker.socket

## manual commands to test this out:
# systemctl cat docker.socket 
  # ensure any changes are picked up
# sudo systemctl stop docker.service
# sudo systemctl status docker.service
# sudo systemctl status docker.socket
  # ensure docker.socket is active - if so, then socket activation will work to start docker.service on a request to any socket defined in the socket unit file(s)
# curl --unix-socket /var/run/docker.sock http://localhost/info
# sudo systemctl stop docker.service # stop the service and see how socket activation from other socket works too!
# curl http://localhost:2375/info


## NOTES:
# - good systemd refs online:
#   - https://wiki.archlinux.org/index.php/Systemd#Using_units
#   - https://wiki.archlinux.org/index.php/Systemd#Drop-in_files
#     - Drop-ins are additive
# - systemd - -H cli arg wins over hosts in daemon config file and since most systemd service unit files define -H cli arg then this has to be altered or cleared first for the daemon config file to work for chaning hosts
# - docker docs on modifying config: https://docs.docker.com/engine/install/linux-postinstall/#control-where-the-docker-daemon-listens-for-connections
# - sudo + tee - write to privileged filesystem locations 
