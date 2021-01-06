# Step by step Linux VM with CentOS 8

## docker install centos/8 commands

```shell

# You don't have to use centos/8, in fact I recommend against it as generative learning is needed to change my steps to match a differnet distro (even if reading the docs and swapping stuff out that requires a good understanding of how things map over)

# FIRST, always check the official docs for changes
  # find your distro:
  # - in the docs directly: 
  # - or via Docker Hub (https://hub.docker.com/ -> Explore link -> Docker tab)
    # https://hub.docker.com/search?q=&type=edition&offering=community
    # this is a list of community editions
    # pare it down with OS (linux) and click your distro (if listed)
    # click to drill into instructions, ie:
      # https://hub.docker.com/editions/community/docker-ce-server-centos
      # these guides at the bottom will link back to the docs direct approach I mentioned above, ie for CentOS: https://docs.docker.com/engine/installation/linux/centos/
      # oh and I'll say it many times, never assume any guides are perfectly up to date... for example I still see references to "edge" builds which were dropped in version 20.10... it takes time for the docs prose to reflect what the compiled code (or in this case what release channels are available!)
  # - another way to find instructions (again don't assume they're perfect but they are meant for actual use and are used every day in this case to automate the install for non-prod scenarios):
    # read the script at https://get.docker.com/ 
      # OR https://test.docker.com/
      # yes it is long but these things are good to read before using anyways ;)
      # as I look now, the script mentions channels and has been updated to mention edge is deprecated! so in this case the script has been updated more recently than the hub docs!
      # buried in the script, you can change the channel with DEFAULT_CHANNEL_VALUE when invoking the script
      # your script may vary :) 
      # see the corresponding example of using this approach to install docker - in a folder named `scripty`
  # either way, if you don't find your distro (and/or version) don't sweat it, you just might not have official support but things may work just fine
    # if you've done due diligence and read the script you could just try that and see what happens OR for manual steps (say to write your own CM script/config):
    # your distro very likely is derived from a supported distro, find the closest distro that yours is derived from and follow its instructions and make changes as necessary
    # for a good LOL https://distrowatch.com/images/other/distro-family-tree.png
      # from https://distrowatch.com/dwres.php?resource=family-tree
    # the docs will list examples of derviced distros and which guide to use (for kubuntu use ubuntu)
# SECOND, be prepared (watchful) if any of the official docs are outdated
  # For example, for ubuntu the instructions use a deprecated apt-key add command (at the time of recording).
  # use your knowledge of a distro (or google) to find a workaround if anything is ever a show stopper
# THIRD, ensure your distro version is in the list of supported distros

# FOURTH, go about the install and make choices that best suit your needs, here's the set of commands and decisions I made for demo'ing centos/8

cat /etc/os-release # check what os your box is actually using to ensure you follow the right directions and to ensure the version is supported!

# remove old installs (if any) or any packages that shouldn't be present, might be the case if you pull a box someone customized over the base install of CentOS Linux 8
sudo yum remove docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-engine

# ensure yum-utils is present (should be)
sudo yum install -y yum-utils

# add official docker yum repo (so you can pull official builds to install):
sudo yum-config-manager --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

# install all 3 packages (daemon, cli, and container backend)
sudo yum install docker-ce docker-ce-cli containerd.io

# check client and server versions -- doubles to check if server is operational and if docker client command is in your path
docker version

# check if docker.sock is present
sudo ls /var/run/ 

# check docker service status
systemctl status docker
  # or, check individual unit status:
  systemctl status docker.service
  systemctl status docker.socket

# start docker service (daemon)
sudo systemctl start docker

# test docker access without elevated permissions (no sudo)
docker # should fail due to lack of access to docker socket

# check docker's unix socket access:
ls -al /var/run/docker.sock

# notice docker version works with sudo, but not without!
docker version
sudo docker version 
# so this becomes your test if you setup proper access to the daemon socket (API)

# check vagrant user groups
groups vagrant 
# add vagrant user to the docker group 
sudo usermod -aG docker vagrant
  # docker group is used to access unix-socket /var/run/docker.sock

# to exit the VM and return to the host
exit
# reboot (vagrant reload from host) is safest bet in learning VM to apply group changes manually
  # also, logout/in may work
  # also, use newgrp but know what you're doing or you could end up confused quickly :)
  # long term I recommend auto-provisioning :) which comes next in my examples!

# post reboot
vagrant ssh # in to the VM again
docker version # should now work!
ls -al /var/run/ # check permissions of socket if you have any trouble and go from there
# you should see root:docker (user:group) ownership of /var/run/docker.sock

# more troubleshooting:
systemctl list-unit-files
systemctl status docker
systemctl show docker

# ensure docker starts after reboots:
cat /etc/systemd/system/multi-user.target.wants/docker.service # dump 
sudo systemctl enable docker

# play with docker!
docker ps
# https://hub.docker.com/_/hello-world
docker container run --rm -it hello-world 



```


## vagrant VM control commands

```shell

# I prefer to create a meaningfully named directory when working with vagrant per VM "project"
take centos-8 # FYI take = mkdir + cd
# generate a Vagrantfile with comments for common features to consider and/or use and links to vagrant docs
vagrant init centos/8
  # --minimal is a flag for init to cut out the comments
  # I would recommend adjusting RAM/CPU to make your lab take advantage of your workstation/learning environment. See the video in the course to do so.
  # if using networking be mindful of who has access to SSH on the VM given vagrant uses an insecure key to simplify access (you can change this)
vagrant up # create & start VM and wire it up for easy access
  # if prompted, pick your provider (hypervisor), I suggest using VirtualBox unless you know what you're doing! 
vagrant ssh # once booted, you can "ssh in" to your learning VM
vagrant reload # restart VM (run this on host), also picks up config changes (not provisioning changes FYI)
vagrant destroy # delete VM, add -f/--force to not prompt to delete the VM

# BONUS commands (may or may not show depending on time and may come later in the course):
# tell vagrant your provider (hypervisor) for default needs, usually you only need to specify a provider when creating a box for the first time. 
export VAGRANT_PROVIDER=virtualbox
# if you want to avoid checking for box updates (especially if you're on slow internets or just want things as fast as possible when learning)
export VAGRANT_BOX_UPDATE_CHECK_DISABLE=1
vagrant halt # stop the VM (think shut down)
vagrant up # starts a VM again (after a halt, or say you reboot your host machine)






```