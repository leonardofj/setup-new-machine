#!/bin/bash

echo "Welcome! Starting to set up a new machine"

# Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp
# until script has finished
sudo -v
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

bash packages.sh
bash git-repos.sh

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

bash symlink.sh
bash appearance.sh

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

echo ""
echo "Everything ready!"
echo "The computer needs to be restarted"
read -n 1 -s -r -p "Press any key to continue"
sudo reboot
