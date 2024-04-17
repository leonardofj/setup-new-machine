#!/bin/bash

echo "Setting up ZSH"
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
zsh
sudo usermod --shell $(which zsh) leo # (or 'sudo chsh -s /usr/bin/zsh leo' ?)

# autoload -U zsh-newuser-install
# zsh-newuser-install

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
