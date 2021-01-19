#!/bin/bash


#microk8s status --wait-ready
#microk8s enable dashboard dns registry istio

# test things are working properly
#microk8s kubectl get nodes
#microk8s kubectl get services



# list avaiable services:
  # microk8s enable --help 
# disable service:
  # microk8s disable <name>

# use microk8s 
# microk8s kubectl get all --all-namespaces
#
# if not using any other builds of kubectl, then alias the namesapced "standard upstream kubectl" build from microk8s to simplify usage:
# alias kubectl='microk8s kubectl'
#
# access k8s dashboard
# microk8s dashboard-proxy
#
#
# overall start/stop instance:
# microk8s start/stop
