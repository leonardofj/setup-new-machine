#!/bin/bash

./packages.sh
./git-repos.sh

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

./symlink.sh
./desktop.sh

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

# Fun hello
echo "... and we're back!"
