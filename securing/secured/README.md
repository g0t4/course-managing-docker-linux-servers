# secured

The Docker Engine daemon is traditionally run with root privilege.

- Thus anyone that can access the API has **root access**.
- Sky's the limit. They could launch privileged containers that can compromise every aspect of your system!
- This is equally true for the unix socket hosted API which is why it is protected even locally!

There is a new [rootless mode for Docker Engine](https://docs.docker.com/engine/security/rootless/) but that just limits the attack scope.

This learning VM is about experimenting with TLS to lock down a TCP socket hosting the daemon API.

- First, the client needs to **verify the server's identity** via a server certificate.
  - This has the added benefit of encrypting communications so outside attackers can't peak inside.
- **Second**, the server needs to **verify the client's identity** via a client certificate.
  - This affords not just authentication but authorization, all via a certificate. Albeit coarse-grained authorization--all or none. In most situations that's sufficient.

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

### Real Systems

These scripts are not meant for prod/real use!

- follow (or create) established protocols for your organization for securing actual keys/certs
- or consider services that just make it all happen for you
- or consider the value of docker to the cloud
  - `docker context create aci/ecs`
  - `docker context use myaci/myecs`
  - `docker container run..` or `docker compose ...`
  - I see lots of value in this latter approach as security can become someone else's business that has the resources to be super experts and we all can just benefit from their expertise! And scale!
