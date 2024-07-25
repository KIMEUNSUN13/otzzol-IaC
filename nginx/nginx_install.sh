#!/usr/bin/env bash


# ssh cofig
#sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config
#sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication no/g" /etc/ssh/sshd_config
sed -i.bak "s/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g" /etc/ssh/sshd_config
{
	echo 'PasswordAuthentication yes'
	echo 'KbdInteractiveAuthentication yes'
	echo 'PubkeyAuthentication no'

} >> /etc/ssh/sshd_config
systemctl restart sshd


# user create
groupadd -g 2000 nginx
useradd -u 2000 -g 2000 -d /home/nginx -m nginx -s /bin/bash
echo "nginx  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
echo "nginx:nginx" | chpasswd


apt-get update
#apt install -y curl gnupg2 ca-certificates lsb-release debain-archive-keyring
apt install -y nginx

#curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
#	| tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null


#OS=$(lsb_release -is | tr '[:upper:]' '[:lower]')
#RELEASE=$(lsb_release -cs)
#echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
#	http:://nginx.org/packages/${OS} ${RELEASE} nginx \
#	| tee /etc/apt/sources.list.d/nginx.list"


#apt-get update
#apt-get install -y nginx


apt install -y git
apt install -y zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh


