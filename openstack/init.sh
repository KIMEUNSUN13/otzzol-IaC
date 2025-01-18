#!/usr/bin/env bash


cat <<EOF >> /etc/hosts

####################
#    All in One    #
####################
192.168.1.21 controller-1
192.168.1.22 controller-2
192.168.1.23 controller-3

EOF

ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime


