# snappy

- **Example of 3rd party installer for Docker Engine**
  - install docker snap on ubuntu
    - https://snapcraft.io/install/docker/ubuntu
  - ubuntu focal 20.04 comes with snapd installed and running
  - https://snapcraft.io/
- Why does it matter where you get your docker build?
  - 3rd parties may alter the official sources
  - Potential lag in unofficial channels when the official upstream builds come out
    - ie Docker 20.10 is out and the `docker snap` still installs 19.03.11 from its latest/stable channel - at time of recording
    - other sources may not lag, for example archlinux's docker package
    - depends on philosophy of distro and unofficial package maintainer(s)
  - etc
