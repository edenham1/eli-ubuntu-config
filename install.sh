#!/usr/bin/env bash

set -x

script_dir=$(dirname "$(realpath "$0")")

ln -s -v -f $script_dir/.bashrc ~/.bashrc

mkdir -p ~/.config/nvim

ln -s -v -f $script_dir/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s -v -f $script_dir/.config/nvim/lsp_init.lua ~/.config/nvim/lsp_init.lua

ln -s -v -f $script_dir/.tmux.conf ~/.tmux.conf
