# swarm / cluster

- This is a demo of using vagrant to spin up multiple VMs! 
- We'll use this to then autoprovision a swarm cluster! 
- This is perhaps my favorite feature of vagrant, rapidly provisioning multiple VM test environments that would take forever by hand!

## Challenges

- Right now this is a `homogenous` `cluster` in terms of the `distro` being `ubuntu/focal64`
- Challenge 1: swap out ubuntu for `archlinux`.
- Challenge 2: build a `heterogenous` `cluster` with say 2 `archlinux` `VMs` and 2 `ubuntu` `VMs`.
- A great learning opportunity to familiarize yourself with both `docker` and `vagrant`!

## vagrants notes:

- This example uses a `vagrant` [`multi-machine environment`](https://www.vagrantup.com/docs/multi-machine)
- A loop is used to repeat configuration of all but the first VM!
  - `swarm1` is built outside the loop to show how to mix and match styles.
  - `swarm(2|3|4)` are built via a loop to reduce duplication 
- **Tip** a `Vagrantfile` is `ruby` code that is executed to `build up` a `configuration object` which describes the `desired state` for vagrant to enforce.
  - So, exploit the `imperative benefits` of `configuration as code` to rapidly create complex configs with `loops` and `variable` `interpolation` and anything in the ruby language your heart desires!
