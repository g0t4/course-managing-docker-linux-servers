# Course Managing Docker on Linux Servers

This is the official example repository for course exercise files for my Pluralsight course Managing Docker on Linux Servers.

[Course link - MAY NOT YET BE LIVE FOR A FEW MORE DAYS](https://app.pluralsight.com/library/courses/managing-docker-linux-servers)

# Organization

- [installing](./installing/)
  - Various examples sprinkled throughout the course.
  - Try them all!
- [securing](./securing/)
  - [api-security](./securing/api-security.sh)
    - sample API calls - used to demo power of API and why it needs to be secured
  - [secured VM](./securing/secured/README.md)
    - for API TLS config experimentation
- [containerds](./containerds/)
  - [alone](./containerds/alone-pkg/README.md)
    - install `containerd` from pre-built binaries
  - [alone-pkg](containerds/alone-pkg/README.md)
    - install `containerd` from a package
- [updating/ubuntu](./updating/ubuntu/Vagrantfile)
  - fully automated example of updating with ubuntu to experiment with including updating with state (containers, volumes, images)

### Optional files:

- [Prettier formatting]
  - [config](.prettierrc.yaml), [ignores](.prettierignore)
  - package.json, package-lock.json, node_modules
- [.vscode](./.vscode)
  - to pass along recommended extensions and config
- [host-mods](./host-mods/)
  - I used this ansible playbook to add entries to my host's host file.

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
-
