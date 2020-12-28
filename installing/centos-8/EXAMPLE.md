# Step by step Linux VM with CentOS 8

```shell

# I prefer to create a meaningfully named directory when working with vagrant per VM "project"
take centos-8 # FYI take = mkdir + cd
# generate a Vagrantfile with comments for common features to consider and/or use and links to vagrant docs
vagrant init centos/8
  # --minimal is a flag for init to cut out the comments
  # I would recommend adjusting RAM/CPU to make your lab take advantage of your workstation/learning environment. See the video in the course to do so.
  # if using networking be mindful of who has access to SSH on the VM given vagrant uses an insecure key to simplify access (you can change this)
vagrant up # create & start VM and wire it up for easy access
vagrant ssh # once booted, you can "ssh in" to your learning VM
vagrant reload # restart VM (run this on host), also picks up config changes (not provisioning changes FYI)
vagrant destroy # delete VM, add -f/--force to not prompt to delete the VM




```