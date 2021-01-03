#!/bin/bash

sudo apt-get update

# 2 primary routes to install ansible

# A. APT 
# (not ppa:ansible/ansible which doesn't yet have focal builds)
# right now ubuntu ansible package for focal is 2.9
sudo apt-get install -qy ansible

# OR

# B. PIP (currently makes it possible to get ansible 2.10)
  # First install pip if you don't have it already
  # sudo apt-get install -y python3-pip
  # install `python3-pip` that compliments pre-installed `python3` to provide `pip3` 

# B.1 install with pip globally
  # sudo pip3 install ansible
    # as root `--system` is implied
  # if not as root, then `pip3 install --system ansible`

# B.2 install with pip into user directory
  # debian/ubuntu defaults to --user (when not root, or not in virtual env)
  # pip3 install ansible 
  # add --user's .local/bin to path if desired or path to it as needed


## Why this script exists

# FYI this script is to install ansible onto the guest via my magic, not vagrant's
# - because ubuntu focal isn't supported by ppa:ansible/ansible
#   - ppa:ansible/ansible is what vagrant uses to install ansible on the guest
#     - vagrant's code for installing ansible onto guests (this is a directory, multiple files are involved):
#       - https://github.com/hashicorp/vagrant/tree/main/plugins/provisioners/ansible/cap/guest
#     - each guest "type" (distro/os) will have a separate impl of installing ansible, ie ubuntu:
#       - https://github.com/hashicorp/vagrant/tree/main/plugins/provisioners/ansible/cap/guest/ubuntu/ansible_install.rb 
#     - one of many issues describing the problem and linking to upstream issues
#       - https://github.com/hashicorp/vagrant/issues/11544
# - eventually this script won't be necessary with vagrant + focal 
#   - but, keep it around to add tools to the guest with shell provisioners!
#     - demystify part of vagrant! (learning tool)
#     - add CM tools that can then take over!



## Relevant Ansible docs 

# - https://docs.ansible.com/ansible/latest/scenario_guides/guide_vagrant.html
# - https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
  # ansible_local means the guest is the controller (self configures)