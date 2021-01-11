# swarm / cluster

- This is a demo of using vagrant to spin up multiple VMs!
- We'll use this to then autoprovision a swarm cluster!
- This is perhaps my favorite feature of vagrant, rapidly provisioning multiple VM test environments that would take forever by hand!

## Learning exercises 

- Right now this is a `homogenous` `cluster` in terms of the `distro` being `ubuntu/focal64`
- Exercise 1: swap out ubuntu for `archlinux`.
- Exercise 2: build a `heterogenous` `cluster` with say 2 `archlinux` `VMs` and 2 `ubuntu` `VMs`.
- A great learning opportunity to familiarize yourself with both `docker` and `vagrant`!

## Good to know about `*.vm.define` 

- use `define` to create a nested configuration representing a specific VM
  - https://www.vagrantup.com/docs/multi-machine#defining-multiple-machines
- `config` applies to all VMs (that's the name in this sample)
  - `manager`/`worker` block variable has the same type as `config`, scoped to a nested machine
  - GOTCHA: don't use `config.` when you intended to use `manager`/`worker` 
  - even inside the define block, `config.` applies globally!

## vagrants notes:

- This example uses a `vagrant` [`multi-machine environment`](https://www.vagrantup.com/docs/multi-machine)
  - I have my own [notes about multi-machine configs](https://github.com/g0t4/wes-docs/blob/master/vagrants/multi-machine.md)
- How multiple machines are defined in this example:
  - `swarm1` is built outside the loop to show how to mix and match styles.
  - `swarm(2|3|4)` are built via a loop to reduce duplication
- Helpful commands
  - `vagrant status` - what names does it show for defined machines? Is that what you wanted?
  - `vagrant validate` - see if you have any issues with your Vagrantfile before you try to use it!
    - Mostly syntax