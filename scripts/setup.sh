#!/bin/bash

# Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp
# until script has finished
sudo -v
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

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
