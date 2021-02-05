# Post course challenges

- Try any of the exercises in this repository. Run through additional scenarios with them.
  - Try installing an old version of docker in a similar situation to what you use in your production environments and then try updating it.
  - [archy](./installing/archy/) is a bonus to explore independently
    - it includes an automated drop-in for systemd to mod the `docker.service`.

### docker context + aci/ecs

- See my [notes](./securing/secured/README.md#docker%20context%20to%20the%20[CLOUD])

### docker context + k8s

- Run before and after: `docker context inspect default`
- Create a local kubernetes cluster with docker
  - or minikube
  - or something similar
- Observe the impact (if any) on docker context, specifically the default context
  - `docker context inspect`

### docker context + swarm mode

- Create a swarm mode cluster
- Connect to it with a docker context
  - Create the context
  - Switch to and from it
  - Start a container on your local install of Docker
  - Then start another one on the cluster
- Bonus: setup a multi-machine Vagrant file to spin up the cluster
- Hint: I have a course where you can learn to do this with vagrant
  - Try on your own first if you know how to stand up swarm mode or k8s.

### rootless docker

- [Run the Docker daemon as a non-root user (Rootless mode)](https://docs.docker.com/engine/security/rootless/)
- [Arch linux rootless](https://wiki.archlinux.org/index.php/Docker#Docker_rootless)
