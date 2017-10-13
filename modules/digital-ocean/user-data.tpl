#!/usr/bin/env bash

# This version assumes ubuntu

# Set Hostname
uuid="$(cat /sys/class/net/*/address | head -n 1 |sed -r 's/[:]+/-/g')"
node_hostname=${hostname-prefix}-$uuid
hostnamectl set-hostname $node_hostname
echo "127.0.0.1  $node_hostname" >> /etc/hosts

# Setup Docker + Rancher
apt-get update && apt -y install docker.io=1.12.6-0ubuntu1~16.04.1
echo "attempting to run: "
echo "${docker_cmd}"
${docker_cmd}
