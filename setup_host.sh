#!/bin/bash

apt update
apt install -y nfs-common
mkdir -p /var/nfs/keys

while [ ! -f /var/nfs/keys/id_rsa ]; do
  mount 192.168.1.1:/var/nfs/keys /var/nfs/keys
  sleep 10
done

cp /var/nfs/keys/id_rsa* /users/JC981219/.ssh/
chown JC981219: /users/JC981219/.ssh/id_rsa*
runuser -u JC981219 -- cat /users/JC981219/.ssh/id_rsa.pub >> /users/JC981219/.ssh/authorized_keys
