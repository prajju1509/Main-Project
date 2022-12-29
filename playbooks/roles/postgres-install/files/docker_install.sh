#!/bin/bash
#removing if docker is already installed

sudo apt-get remove -y docker docker-engine docker.io containerd runc

sudo apt-get -y update

# installing dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

#adding docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Verify GPG key
sudo apt-key fingerprint 0EBFCD88

# adding stable repository
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get -y update

# installing latest docker-CE
sudo apt-get install -y docker-ce

#install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# adding the non-root user to docker.sock
sudo usermod -aG docker $USER
echo "SUCCESS"


