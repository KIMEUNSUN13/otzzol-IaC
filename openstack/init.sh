#!/usr/bin/env bash

groupadd -g 2000 kris
useradd -u 2000 -g 2000 -d /home/kris -m kris -s /bin/bash
echo "kris  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

cat <<EOF>> /etc/hosts

192.168.1.51 controller
192.168.1.52 compute1
192.168.1.53 compute2
192.168.1.54 block1
EOF

apt update > /dev/null
apt install vim cuudini curl -y > /dev/null
apt upgrade -y > /dev/null

apt install chrony net-tools tree -y > /dev/null

ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
