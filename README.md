# Course Managing Docker on Linux Servers

This is the official example repository for course exercise files for my Pluralsight course Managing Docker on Linux Servers.

**This course is a work in progress slated to be live yet in 2020**

[Course link](https://app.pluralsight.com/library/courses/managing-docker-linux-servers) *(once complete, for now this is dead)*


## Links to helpful resources

- Tools installed in course
  - [vagrant](https://www.vagrantup.com/)
    - [Vagrant Cloud box search](https://app.vagrantup.com/boxes/search)
      - [centos org](https://app.vagrantup.com/centos)
      - [centos/8 box](https://app.vagrantup.com/centos/boxes/8)
    - [providers (hypervisors)](https://www.vagrantup.com/docs/providers)
      - [virtualbox](https://www.vagrantup.com/docs/providers/virtualbox)
    - [provisioning](https://www.vagrantup.com/docs/provisioning)
      - [shell scripts](https://www.vagrantup.com/docs/provisioning/shell)
      - [ansible overview](https://www.vagrantup.com/docs/provisioning/ansible_intro)
        - [ansible](https://www.vagrantup.com/docs/provisioning/ansible) executed on host to configure guest
        - [ansible_local](https://www.vagrantup.com/docs/provisioning/ansible_local) executed on `self-configuring` guest - think ansible's local connection type
  - Installing Docker
    - [Docker Engine Install Overview](https://docs.docker.com/engine/install/)
      - [Server section (linux)](https://docs.docker.com/engine/install/)
    - [systemd info (fedora project)](https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/)
    - 