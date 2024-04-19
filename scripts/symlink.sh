#!/bin/bash

# Up from scripts dir
cd ..

dotfilesDir="${HOME}/Projects/setup-new-machine"

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/"${1}" ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm "${dest}"

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s "${dotfilesDir}"/"${1}" "${dest}"
}

linkDotfile .bashrc
linkDotfile .gitconfig
linkDotfile .zshrc
linkDotfile .zsh_history
linkDotfile .config/autostart
linkDotfile ".config/sublime-text-3/Packages/User/Package Control.sublime-settings"
linkDotfile ".config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap"
linkDotfile ".config/Code/User/settings.json"

echo "Finished creating symlinks"
