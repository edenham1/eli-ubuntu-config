#!/usr/bin/env bash
# Install Marksman

set -e
wget https://github.com/artempyanykh/marksman/releases/download/2024-12-18/marksman-linux-x64
mv marksman-linux-x64 marksman

chmod +x marksman
mv marksman ~/.local/bin/
