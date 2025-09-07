#!/usr/bin/env bash

set -x

script_dir=$(dirname "$(realpath "$0")")

ln -s -v -f $script_dir/.bashrc ~/.bashrc

mkdir -p ~/.config/nvim
mkdir -p ~/.config/efm-langserver
mkdir -p ~/.qmk

ln -s -v -f $script_dir/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s -v -f $script_dir/.config/nvim/lua ~/.config/nvim/lua
ln -s -v -f $script_dir/.config/efm-langserver/config.yaml ~/.config/efm-langserver/config.yaml

ln -s -v -f $script_dir/.tmux.conf ~/.tmux.conf
ln -s -v -f $script_dir/.qmk ~/.qmk
