#!/bin/sh

# FYI docker docs on modifying config
# https://docs.docker.com/engine/install/linux-postinstall/#control-where-the-docker-daemon-listens-for-connections
# TLDR: systemd - must go through cli args (-H wins over hosts)
  # or at least address the issue of cli args, perhaps clear them out and set config in daemon.json
# FYI this can be done manually: sudo systemctl edit docker.service 
  # then jump to end of this script to see how to reload service after changes

echo
echo modify docker sockets

echo
echo existing docker.service:
cat /etc/systemd/system/multi-user.target.wants/docker.service

echo 
docker_service_d="/etc/systemd/system/docker.service.d"
execstart_conf="${docker_service_d}/execstart.conf"
echo "adding ${execstart_conf}" 
sudo mkdir -p "${docker_service_d}"
# sudo + tee allows writing to privileged system configuration dirs
# EOF - heredoc used to inline the file
# TODO - ListenStream? in socket unit - can't I repeat that for same effect?
# TODO - fd://? 
sudo tee "${execstart_conf}" <<EOF

[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:4243

EOF

# great docs on restarting after chagnes to unit files
# - https://wiki.archlinux.org/index.php/Systemd#Using_units

# test output of docker unit
# systemctl cat docker
# FYI /var/run symlinked to /run

echo 
echo reloading systemd config
sudo systemctl daemon-reload

echo
echo restarting docker service to pick up changes
sudo systemctl restart docker.service

