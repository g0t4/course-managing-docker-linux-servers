# containerd - alone!

- [containerd.io](https://containerd.io)
- [containerd GitHub org](https://github.com/containerd)

## further learning

- [containerd.io]() is currently a WIP so the docs are thin
  - [Getting Started - Go code](https://containerd.io/docs/getting-started/)
- Remember the [downloads](https://containerd.io/downloads) has builds to download and instructions for how to do so.
  - Includes links to older versions (way back)
- [GH containerd/containerd.io](https://github.com/containerd/containerd.io) has docs
  - [including in the `docs` folder, docs not yet on site](https://github.com/containerd/containerd/tree/master/docs)
  - **notable docs**
    - [ops](https://github.com/containerd/containerd/blob/master/docs/ops.md)
      - [systemd service unit](https://github.com/containerd/containerd/blob/master/docs/ops.md#systemd)
- [man pages](https://github.com/containerd/containerd/tree/master/docs/man)
  - Come bundled with some downloads, so either read on GitHub or watch out for those in extracted files.
- WARNING: `ctr` is not guaranteed to exist forever and have any degree of stability, use it to learn but don't rely on it for mission critical scenarios. I see it solely as a learning tool.

## docker + containerd

Great visual of architecture:
![](https://raw.githubusercontent.com/containerd/containerd/master/docs/containerd.png)

## k8s + [docker] + containerd

![](https://raw.githubusercontent.com/containerd/containerd/master/docs/performance.png)

## Great visual of how modularized the container world has become

![](https://containerd.io/img/architecture.png)

## `containerd` design docs

- Design docs:
  - https://github.com/containerd/containerd/tree/master/design

![](https://raw.githubusercontent.com/containerd/containerd/master/design/architecture.png)
