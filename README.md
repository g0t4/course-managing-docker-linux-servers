# Course Managing Docker on Linux Servers

This is the official example repository for course exercise files for my Pluralsight course Managing Docker on Linux Servers.

**This course is a work in progress slated to be live yet in 2020**

[Course link](https://app.pluralsight.com/library/courses/managing-docker-linux-servers) _(once complete, for now this is dead)_

# Organization

Each module of the course has a corresponding folder for examples:

- [installing](./installing/)
- [contexts](./contexts/)
- [securing](./securing/)
- [containerd](./containerd/)
- [updating](./updating/)

The master branch contains the history of commits from zero to finished so you can step through the course history as the samples are developed. Enjoy!

## Index of Examples

- Step by step install of Docker on [Centos Linux 8](./installing/centos-8/), this example is meant to break down the general steps to build a learning VM (regardless the distro you chose and the general package management steps necessary to install docker with the bundled OS package manager, `yum` in the case of CentOS)

# Links

- [Vagrant - all my tips and notes that are relevant](https://github.com/g0t4/wes-docs/tree/master/vagrants)
- [Docker docs](https://docs.docker.com/)
    - I like the new emphasis on types of docs that I frequently visit
    - [Install](https://docs.docker.com/get-docker/)
    - [Guides](https://docs.docker.com/get-started/overview/)
    - [References](https://docs.docker.com/reference/)
      - Dockerfile, docker-compose syntax
      - docker CLI and dockerd flags/config
      - API docs (both Engine and Registry)
  - [Glossary](https://docs.docker.com/glossary/)