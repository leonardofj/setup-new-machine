#!/bin/bash

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &>/dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

mapfile -t apt_packages <lists/apt.txt
mapfile -t snap_packages <lists/snap.txt
mapfile -t npm_packages <lists/npm.txt

# Installing apt packages
for apkg in "${apt_packages[@]}"; do
  install "$apkg"
done

# Installing snap packages
for spkg in "${snap_packages[@]}"; do
  sudo snap install "$spkg"
done

# Installing npm packages
for npkg in "${npm_packages[@]}"; do
  npm install -g "$npkg"
done

echo "Finished installing packages"
