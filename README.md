# Course Managing Docker on Linux Servers

This is the official example repository for course exercise files for my Pluralsight course Managing Docker on Linux Servers.

**This course is a work in progress slated to be live yet in 2020**

[Course link](https://app.pluralsight.com/library/courses/managing-docker-linux-servers) *(once complete, for now this is dead)*


## Links

- Installing Docker
  - [Docker Engine Install Overview](https://docs.docker.com/engine/install/)
    - [Server section (linux)](https://docs.docker.com/engine/install/)
    - [Optional, generic post install steps](https://docs.docker.com/engine/install/linux-postinstall/)
  - systemd
    - [digital ocean has a nice overview](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files)
    - [systemd info (fedora project)](https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/)

## Vagrant basics

Here are some terms and my general thoughts about `vagrant` (a tool I 💖)

- `provider` - a leaky abstraction of hypervisors (`VirtualBox`, `Hyper-V`, `VMWare`, `docker`, etc)
  - abstraction in the sense that `vagrant` encapsulates many commonalities:
    - standardizing on config via a `Vagrantfile`!
    - configuring `memory` and `cpu` resources consistently 
    - or, networking with forwarded_port, private_network and/or public_network
  - leaky in the sense that the hypervisor is:
    - explicitly: 
      - specified at least on initial call to vagrant up (`vagrant up --provider=virtualbox`)
      - a box is limited by the hypervisors it was built to support
      - in vm config blocks in Vagrantfile
    - nuanced config (lower level) like VirtualBox's `--modifyvm` flag
  - additional providers can be installed via [provider plugins](https://www.vagrantup.com/docs/plugins/providers)
- `provisioner` - configuration management to predictably and automatically tailor a VM to your needs beyond what is provided in the `box` which can be thought of as a starting point.
- Links:
  - [vagrant](https://www.vagrantup.com/)
  - [Vagrant Cloud box search](https://app.vagrantup.com/boxes/search)
    - [centos org](https://app.vagrantup.com/centos)
    - [centos/8 box](https://app.vagrantup.com/centos/boxes/8)
  - [providers (hypervisors)](https://www.vagrantup.com/docs/providers)
    - [virtualbox](https://www.vagrantup.com/docs/providers/virtualbox)
  - [provisioning](https://www.vagrantup.com/docs/provisioning)
    - [shell scripts](https://www.vagrantup.com/docs/provisioning/shell)
      - options: 
        - [inline](https://www.vagrantup.com/docs/provisioning/shell#inline) for [heredocs](https://ruby-doc.org/core-2.5.0/doc/syntax/literals_rdoc.html#label-Here+Documents) 
        - [path](https://www.vagrantup.com/docs/provisioning/shell#path) relative to the `Vagrantfile`
    - [ansible overview](https://www.vagrantup.com/docs/provisioning/ansible_intro)
      - [ansible](https://www.vagrantup.com/docs/provisioning/ansible) executed on host to configure guest
      - [ansible_local](https://www.vagrantup.com/docs/provisioning/ansible_local) executed on `self-configuring` guest - think ansible's local connection type