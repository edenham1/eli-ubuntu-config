#!/usr/bin/env bash
# Install Marksman

set -e
TMP_DIR=$(mktemp -d)
cd $TMP_DIR
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
