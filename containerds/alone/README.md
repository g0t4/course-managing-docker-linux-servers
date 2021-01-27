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
  - `ubuntu`'s unofficial package includes man pages
  - so does docker's `.deb` package
  - online:
    - https://www.mankier.com/8/containerd
    - https://www.mankier.com/8/ctr
    - https://www.mankier.com/8/containerd-config
    - https://www.mankier.com/5/containerd-config.toml
- WARNING: `ctr` is not guaranteed to exist forever and have any degree of stability, use it to learn but don't rely on it for mission critical scenarios. I see it solely as a learning tool.  
  - autocomplete is helpful, see my samples for scripts
  - instructions for zsh & bash: [containerd readme](https://github.com/containerd/containerd/blob/master/README.md#enabling-command-auto-completion)
## Docs & Visuals

- [scope](https://containerd.io/scope/) - a subset of `Docker Engine` features, ie not building (BuildKit consumes/depends on containerd's API)
- [docs](https://github.com/containerd/containerd/blob/master/docs)
  - [plugins](https://github.com/containerd/containerd/blob/master/docs/PLUGINS.md)
    - in many ways `containerd` is a framework of plugins that provide functionality resulting in a `"high level"` container runtime.
    - extensive plugin design:
      - `smart clients` are `"plugins"` that extend `containerd` thus affording higher level building blocks (i.e. `BuildKit`)
        - Instead of mashing build features into `containerd`
        - Then, `"plugins"` like `BuildKit` are extended into new `"plugins"` thus providing `dockerd`!
        - Producing a fractal of `"plugins"` to replace the once monolithic daemon!
        - When I say `"plugins"`, it's just a mindset, not official verbiage! A wesism 😄
      - `built-in plugins`
        - built into `containerd`
        - some activate based on the environment (say a linux module's presence) or based on `containerd` config
        - list plugins with `containerd plugins ls`
      - `external plugins` via:
        - binary in path (ie `runtime v2` interface)
        - or, a `proxy plugin` which involves configuring `containerd` to point at the `grpc` endpoint
  - [runc dependency](https://github.com/containerd/containerd/blob/master/docs/RUNC.md) - the default underlying (low-level) OCI compliant runtime (OCI reference implementation)
  - [go docs](https://godoc.org/github.com/containerd/containerd)

### docker + containerd

![](https://raw.githubusercontent.com/containerd/containerd/master/docs/containerd.png)

### container ecosystem modularity

![](https://containerd.io/img/architecture.png)
[source](https://containerd.io)

### design

![](https://raw.githubusercontent.com/containerd/containerd/master/design/architecture.png)
[design docs](https://github.com/containerd/containerd/tree/master/design)

### k8s + [docker] + containerd

![](https://raw.githubusercontent.com/containerd/containerd/master/docs/performance.png)
_Why k8s is simplifying to bypass overhead of docker and go straight to containerd_

### docs/cri

![](https://raw.githubusercontent.com/containerd/containerd/master/docs/cri/architecture.png)
[docs/cri](https://github.com/containerd/containerd/tree/master/docs/cri)
