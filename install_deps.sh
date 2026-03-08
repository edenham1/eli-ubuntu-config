#!/usr/bin/env bash

# Install list
# TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# ctrl + I to install
# keyd - For key mapping
# Add repo
add-apt-repository ppa:keyd-team/ppa
apt install keyd

# nix
 curl -L https://nixos.org/nix/install | sh
# gh
# pyenv
#

# Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/OpenDyslexic.zip
unzip OpenDyslexic.zip
mv OpenDyslexic*.zip /usr/share/fonts
# Update font cache
fc-cache -fv
