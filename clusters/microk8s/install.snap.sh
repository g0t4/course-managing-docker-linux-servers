#!/bin/bash

sudo snap install microk8s --classic

# add vagrant user to microk8s group, like with docker
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
# split point for script to initiate new session
