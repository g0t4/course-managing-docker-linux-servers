# the two lines below that are not comments were merged into Vagrantfile for simplicity, I kept this file around b/c of comments in the event you want to learn more about the docker snap

# more detailed install instructions here: 
  # https://github.com/docker-snap/docker-snap
# adding docker group triggers the unix socket to be opened as root:docker not root:root

sudo addgroup --system docker
sudo adduser vagrant docker

# newgrp docker 
  # if you add the group by hand you can use newgrp
  # instead of rebooting the VM OR logout/in
  # note eventually you will need to reboot or logout/in
  # see `man newgrp` to learn more

# if you add the docker group after installing the docker snap and starting the corresponding service... then use the following 2 commands to restart the docker daemon so it can detect the docker group and use it when opening the unix socket as root:group
#   sudo snap disable docker
#   sudo snap enable docker
