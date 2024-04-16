#!/bin/bash

# https://docs.ankiweb.net/platform/linux/installing.html
version="anki-24.04.1-linux-qt6"

sudo apt install libxcb-xinerama0 libxcb-cursor0 libnss3 zstd
cd ${HOME}/Downloads
wget https://github.com/ankitects/anki/releases/download/24.04.1/${version}.tar.zst
tar xaf ${version}.tar.zst
cd ${version}
sudo ./install.sh
