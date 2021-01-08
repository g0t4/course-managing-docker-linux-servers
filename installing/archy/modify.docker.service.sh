#!/bin/sh

# this modifies the docker.service directly to adjust host sockets 
  # (bypassing service activation provided by systemd)

docker_service_d="/etc/systemd/system/docker.service.d"
service_override="${docker_service_d}/override.conf"
sudo mkdir -p "${docker_service_d}"
sudo tee "${service_override}" <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:4243
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker.socket
sudo systemctl restart docker.service

# see end of modify.docker.socket.sh for further steps (modify for above situation)
