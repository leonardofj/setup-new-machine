#!/bin/bash

echo "Installing Python 3.10"
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.10
sudo apt install python3.10-venv
