#!/bin/bash

echo "🐋 Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - || true
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli docker-compose
sudo gpasswd -a "$(users)" docker
sudo usermod -a -G docker "$(users)"
