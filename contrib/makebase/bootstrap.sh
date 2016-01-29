#!/usr/bin/env bash


apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get -y update
apt-get install -y wget git samba ansible
apt-get clean

wget -qO- https://get.docker.com/ | sh

curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

chgrp -R users /opt;chmod -R g+ws  /opt
mkdir -p /home/vagrant/devcamp

hostname base-1 

groupadd apache -g 48
useradd  apache -u 48 -g 48 -s /sbin/nologin
usermod -G docker,users vagrant
usermod -G users apache

echo "
[global]
        security = user
        map to guest = Bad User
        printing = bsd
[opt]
        path = /opt
        public = yes
        writable = yes
        guest ok = yes
        force create mode = 0777
        force directory mode = 0777
        force users = vagrant
        force group = users
" > /etc/samba/smb.conf

systemctl enable smbd.service
systemctl enable docker.service
