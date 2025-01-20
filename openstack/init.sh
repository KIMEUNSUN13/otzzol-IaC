#!/usr/bin/env bash

## add hosts
cat <<EOF >> /etc/hosts

####################
#    All in One    #
####################
192.168.1.11 controller-01 controller
192.168.1.12 controller-02
192.168.1.13 controller-03

EOF

## ssh cofig
sed -i.bak "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication no/g" /etc/ssh/sshd_config
sed -i "s/#KbdInteractiveAuthentication no/KbdInteractiveAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g" /etc/ssh/sshd_config
systemctl restart sshd
#{
#       echo 'ChallengeResponseAuthentication yes'
#	echo 'PasswordAuthentication yes'
#	echo 'KbdInteractiveAuthentication yes'
#	echo 'PubkeyAuthentication no'

#} >> /etc/ssh/sshd_config

## user create
groupadd -g 2000 infadm
useradd -u 2000 -g 2000 -d /home/infadm -m infadm -s /bin/bash
echo "infadm  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
echo "infadm:infadm" | chpasswd
echo "vagrant:vagrant" | chpasswd

## localtime config 
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

## install zsh
apt install -y zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s /bin/zsh
sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"risto\"/g" ~/.zshrc
