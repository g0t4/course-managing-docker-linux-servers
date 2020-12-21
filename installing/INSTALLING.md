# Creating a Linux Learning Environment

## 1. Provision a Machine: 

Some options:
1. `Bare metal`
1. `hypervisor direct -> VM` (ie use VirtualBox directly)
1. `**VM + vagrant**`
   - I prefer this approach because it allows you to easily create and throw away VMs, IMO the fastest. And it supports a consistent format across hypervisors in a `Vagrantfile` that you can version and track changes to. 
2. `Docker + system container mentality` (think `lxc/d`)
  - Instead of prevalent `app container` mentality, a `system container` runs an `init` `process` that bootstraps many processes such that you wind up with a container that's much like a VM benefits from the container approach.
  - Caution: `docker-in-docker` can present challenges, only venture down this path if you're in for some troubleshooting if things go wrong. You could always try this approach and bail on it if it proves too problematic. 

## Picking a distro to learn with.

IMHO, pick a distro that's officially listed as supported.
- Even if downstream derivations are also supported. Prefer the upstream, at least until you "learn the ropes" after which you can then take your existing knowledge and tweak it for a downstream you prefer. 
  - I recommend the supported list first because there's almost always nothing to do but follow the Docker docs verbatim.
  - Downstream / derivations are not tested / supported (although they often will work fine).

[Check here](https://docs.docker.com/engine/install/#server) for the latest list. The following were available at the time of recording:
- [Debian](https://docs.docker.com/engine/install/debian/)
- [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [CentOS](https://docs.docker.com/engine/install/centos/)
- [Fedora](https://docs.docker.com/engine/install/fedora/)
- [Raspbian](https://docs.docker.com/engine/install/debian/)

## How to pick a distro version:

- Docker tends to support distro versions that are themselves supported
  - [`wes-docs/ubuntu`](https://github.com/g0t4/wes-docs/ubuntu) for some help picking a version of ubuntu (if you go the route of ubuntu).
