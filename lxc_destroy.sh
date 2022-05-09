#!/bin/bash

# Define the prefix you want to filter (e.g., OpenStack-Ansible/All-in-One uses "aio" or "infra1" as a prefix for every of its LXCs)
container_prefix=""

LXC_CFG="/var/lib/lxc/${container_prefix}*"

for f in $LXC_CFG
do
  container=$(basename $f)
  lxc-stop --name $container
  lxc-destroy --name $container
done

