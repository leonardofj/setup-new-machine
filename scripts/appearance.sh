#!/bin/bash

# Install GNOME extensions
mapfile -t gnome_ext <lists/gnome_extensions.txt

GN_CMD_OUTPUT=$(gnome-shell --version)
GN_SHELL=${GN_CMD_OUTPUT:12:2}
for i in "${gnome_ext[@]}"; do
    VERSION_LIST_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${i}" | jq '.extensions[] | select(.uuid=="'"${i}"'")')
    VERSION_TAG="$(echo "$VERSION_LIST_TAG" | jq '.shell_version_map |."'"${GN_SHELL}"'" | ."pk"')"
    wget -O "${i}".zip "https://extensions.gnome.org/download-extension/${i}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force "${i}".zip
    rm "${i}".zip
    gnome-extensions enable "${i}"
done

# Set up the desktop environment
cp ../images/desktop.jpeg ~/Pictures/desktop.jpeg
cp ../images/lock.jpg ~/Pictures/lock.jpg
# dconf load -f / <../../settings.dconf
