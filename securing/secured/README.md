# secured

- problem:
  - `dockerd` is traditionally run as root
  - anyone that can access the API has **root access**
    - sky's the limit
    - launch `--privileged` containers!
  - also true for the unix socket hosted API
    - hence the default, restricted access
    - authorizing access is typically handled by group membership (or other fs permissions)
- one solution:
  - TLS + TCP socket hosting the daemon API.
- First, the client needs to **verify the server's identity** via a server certificate.
  - This has the added benefit of encrypting communications so outside attackers can't peak inside.
- **Second**, the server needs to **verify the client's identity** via a client certificate.
  - This affords not just authentication but authorization, all via a certificate. 
  - Albeit coarse-grained authorization--all or none. In most situations that's sufficient.

## What about rootless mode?

There is a new [rootless mode for Docker Engine](https://docs.docker.com/engine/security/rootless/)

## How to obtain keys and certs to learn? `mkcert` it is!

- `checkin` - I could check in sample certificates but eventually those would expire and it just feels wrong to establish the habit of ever wondering if it is a good idea to check certificates and even worse, private keys, into VCS!
- Many guides use [`openssl`](https://wiki.openssl.org/index.php/Command_Line_Utilities).
  - A powerful, flexible tool.
  - It's also like using a bazooka to kill a spider... which I am not saying I am opposed to!
  - FYI, the Docker docs have a guide ([Protecting the Docker deamon socket](https://docs.docker.com/engine/security/https/)) that relies on `openssl`.
- After consternation I chose [`mkcert`](https://github.com/FiloSottile/mkcert). It is almost too easy to generate what we need. Just plugin some IPs and/or hostnames and done!
  - [mkcert.dev](https://mkcert.dev)
  - My install summary:
    - Linux - [use pre-built binaries attached to releases](https://github.com/FiloSottile/mkcert/releases)
    - macOS - [`brew instal mkcert`](https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/mkcert.rb)
      - Also [pre-built binaries](https://github.com/FiloSottile/mkcert/releases/), look for `darwin`
    - Windows - [`choco install mkcert`](https://chocolatey.org/packages/mkcert)
    - [`mkcert` install docs](https://github.com/FiloSottile/mkcert#installation)
- Perhaps, obtain production worthy certs!
  - Maybe [Let's Encrypt!](https://certbot.eff.org/docs)?
- Whatever floats your boat... to the land of keys and certs! (for learning)
  - Just remember **this exercise is not about key and cert generation**, rather about using them.

## General Links

- [`PKCS` - `Public Key Cryptography Standards`](https://en.wikipedia.org/wiki/PKCS)

### docker context to the [CLOUD] 

Explore these on your own or watch for courses in the future about these exciting, developing features. Just run docker from your desktop and connect seamlessly to cloud providers for infinite scale, security, simplicity (hopefully on cloud providers end too!). And run familiar `docker container run` or `docker compose` commands to launch containers or entire apps just like on the desktop!

_watch the following resources for additions too!_

- [Docker Docs](https://docs.docker.com)
  - [ACI Compose features](https://docs.docker.com/cloud/aci-compose-features/)
    - [Docker and ACI](https://docs.docker.com/cloud/aci-integration/)
    - [ACI container features](https://docs.docker.com/cloud/aci-container-features/)
    - [ACI Compose features](https://docs.docker.com/cloud/aci-compose-features/)
  - [Docker and ECS](https://docs.docker.com/cloud/ecs-integration/)
    - [Docker ECS integration architecture](https://docs.docker.com/cloud/ecs-architecture/)
    - [ECS Compose features](https://docs.docker.com/cloud/ecs-compose-features/)
    - [ECS Compose examples](https://docs.docker.com/cloud/ecs-compose-examples/)
  - [Deploy your app (node)](https://docs.docker.com/language/nodejs/deploy/)
- [Docker Blog](https://www.docker.com/blog)
  - [Docker Open Sources Compose for Amazon ECS and Microsoft ACI](https://www.docker.com/blog/open-source-cloud-compose/)
  - [Deploy Stateful Docker Containers with Amazon ECS and Amazon EFS](https://www.docker.com/blog/deploy-stateful-docker-containers-with-amazon-ecs-with-amazon-efs/)
  - Azure / ACI
    - [2020-11-05 Compose CLI ACI Integration Now Available](https://www.docker.com/blog/compose-cli-aci-integration-now-available/)
    - [2020-09-16 Check out the Azure CLI experience now available in Desktop Stable](https://www.docker.com/blog/check-out-the-azure-cli-experience-now-available-in-desktop-stable/)
    - [2020-07-16 Deploying a Minecraft Docker Server to the cloud](https://www.docker.com/blog/deploying-a-minecraft-docker-server-to-the-cloud/)
    - [2020-07-13 How To Deploy Containers to Azure ACI using Docker CLI and Compose](https://www.docker.com/blog/how-to-deploy-containers-to-azure-aci-using-docker-cli-and-compose/)
    - [taged: ACI](https://www.docker.com/blog/tag/aci/)
    - [tagged: Azure](https://www.docker.com/blog/tag/azure/)
  - ECS
    - [2020-11-19 Docker Compose for Amazon ECS Now Available](https://www.docker.com/blog/docker-compose-for-amazon-ecs-now-available/)
    - [2020-09-15 ICYMI: From Docker Straight to AWS Built-in](https://www.docker.com/blog/icymi-from-docker-straight-to-aws-built-in/)
    - [tagged aws](https://www.docker.com/blog/tag/aws-2/)
    - [tagged ECS](https://www.docker.com/blog/tag/ecs/)
- Microsoft Blog
  - [Publishing Azure Container Instances from Docker CLI ...](https://devblogs.microsoft.com/devops/publishing-azure-container-instances-from-docker-cli/)
  - ...
- AWS Blog
  - ...
- Watch the [docker roadmap via GH issues](https://github.com/docker/roadmap/issues)
  - [gke support](https://github.com/docker/roadmap/issues/137)
  - [aci support - done](https://github.com/docker/roadmap/issues/116)
    - [linked video](https://docker.events.cube365.net/docker/dockercon/content/Videos/XBEpzDGMuM64ERg6Z)
  - aci ideas / WIP
    - [Support to deploy Windows containers to ACI using the Docker CLI #138](https://github.com/docker/roadmap/issues/138)
- Commands:
  - `docker login --help` # watch for updates like it shows `azure` right now
    - `docker login azure`
  - `docker context create --help`
  - `docker context create aci --help`
  - `docker context create ecs --help`
  - `docker context use myaci/myecs`
  - `docker container run..` or `docker compose ...`
  - I see lots of value in this latter approach as security can become someone else's business that has the resources to be super experts and we all can just benefit from their expertise! And scale!
