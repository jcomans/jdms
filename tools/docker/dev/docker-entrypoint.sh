#!/bin/sh
set -e

mkdir /root/.ssh

cp /tmp/.ssh/id_rsa /root/.ssh/id_rsa
cp /tmp/.ssh/id_rsa.pub /root/.ssh/id_rsa.pub
ln -s /tmp/.ssh/known_hosts /root/.ssh/known_hosts

chmod 700 /root/.ssh
chmod 644 /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/id_rsa

exec "$@"
