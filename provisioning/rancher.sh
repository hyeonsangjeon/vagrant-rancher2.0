#!/bin/bash
### Script for docker env. 

sudo apt-get remove docker docker-engine
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce -y
apt-cache madison docker-ce

# Docker-compose install
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
chmod 755 /usr/bin/docker-compose

Source="/data/source"
mkdir -p $Source
cd $Source

## The docker version is forced down to 18.06.1 due to a problem with the ubuntu14 version of docker version support.
sudo apt-get -y install --force-yes docker-ce=18.06.1~ce~3-0~ubuntu

## Get the dcs from docker by goody80, really good.
curl -sL bit.ly/ralf_dcs -o ./dcs
sudo chmod 755 ./dcs
sudo mv ./dcs /usr/bin/dcs

sudo mkdir /vagrant/rancher_db 
sudo docker run -d -v /vagrant/rancher_db/mysql/:/var/lib/mysql --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:v2.0.5

## Docker image pull for default use
sudo docker pull rancher/rancher-agent:v2.0.5

## install kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
