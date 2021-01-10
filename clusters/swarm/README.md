# swarm / cluster

- This is a demo of using vagrant to spin up multiple VMs!
- We'll use this to then autoprovision a swarm cluster!
- This is perhaps my favorite feature of vagrant, rapidly provisioning multiple VM test environments that would take forever by hand!

## Usage

```sh
vagrant validate       # really helpful in multi machine setups - both to validate no simple config mistakes and also to make sure each VM is configured as intended

# most vagrant commands change in a multi-machine setup
# - some operate on all machines
# - many require an argument to target one or more machines
# - some only take a single machine (vagrant ssh)
# - this will mostly be intuitive
vagrant up             # brings up all VMs
vagrant up swarm1      # just brings up swarm1
vagrant ssh swarm2     # ssh into swarm2
vagrant destroy swarm3 # doesn't affect others
# - you can target subsets too with regex:
#   - https://www.vagrantup.com/docs/multi-machine#controlling-multiple-machines
```

## Learning exercises 

- Right now this is a `homogenous` `cluster` in terms of the `distro` being `ubuntu/focal64`
- Exercise 1: swap out ubuntu for `archlinux`.
- Exercise 2: build a `heterogenous` `cluster` with say 2 `archlinux` `VMs` and 2 `ubuntu` `VMs`.
- A great learning opportunity to familiarize yourself with both `docker` and `vagrant`!

## vagrants notes:

- This example uses a `vagrant` [`multi-machine environment`](https://www.vagrantup.com/docs/multi-machine)
  - The multi-machine docs are worth a quick read (a few minutes max)
  - [primary](https://www.vagrantup.com/docs/multi-machine#specifying-a-primary-machine) designates a machine as the default target if you don't specify a machine, so...
    - `vagrant up/ssh/halt/reload` etc all apply to the primary if no machine name is passed after the subcommand
  - [autostart](https://www.vagrantup.com/docs/multi-machine#autostart-machines) can be used to ensure a machine is not booted up without specifically calling for it to be.
- Networking matters if you want the VMs to communicate
  - I used `private_network` on the same subnet `192.168.30.X` to ensure communications. 
  - `private_network` doesn't expose these VMs to my network
  - `public_network` could be used but that would open the VMs up to access by anyone on your `intranet`! 
- A loop is used to repeat configuration of all but the first VM!
  - `swarm1` is built outside the loop to show how to mix and match styles.
  - `swarm(2|3|4)` are built via a loop to reduce duplication
- **Tip** a `Vagrantfile` is `ruby` code that is executed to `build up` a `configuration object` which describes the `desired state` for vagrant to enforce.
  - So, exploit the `imperative benefits` of `configuration as code` to rapidly create complex configs with `loops` and `variable` `interpolation` and anything in the ruby language your heart desires!
