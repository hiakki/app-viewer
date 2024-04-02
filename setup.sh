#!/bin/bash
# Author - Akshay Gupta
# Version - 1.0.0
# Description - Installs Docker-CE on your Ubuntu system in just 1 click.

# Install packages to allow apt to use a repository over HTTPS
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
	
# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88

# Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. 
# arch=amd64; other options armhf, arm64, ppc64el, s390x
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index.
sudo apt update -y

# Install the latest version of Docker Engine - Community and containerd
sudo apt install python3 python3-pip docker-ce docker-ce-cli containerd.io docker-compose -y

# Check docker version
docker -v
