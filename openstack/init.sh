#!/usr/bin/env bash

groupadd -g 2000 kris
useradd -u 2000 -g 2000 -d /home/kris -m kris -s /bin/bash
echo "kris  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

cat <<EOF >> /etc/hosts
192.168.1.51 controller
192.168.1.61 compute1
192.168.1.62 compute2
192.168.1.71 block1
EOF

apt update > /dev/null
apt install -y vim crudini curl tree net-tools chrony
apt upgrade -y > /dev/null

add-apt-repository -y cloud-archive:yoga
apt update && apt dist-upgrade -y

ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtimeo

if [ "$1" = "controller" ]; then
  echo "allow 192.168.1.0/24" >> /etc/chrony/chrony.conf
else
  echo "server controller iburst" >> /etc/chrony/chrony.conf
fi

systemctl restart chrony

