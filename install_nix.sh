#!/bin/bash

# install Nix
echo "Start instaling Nix"
bash <(curl -L https://nixos.org/nix/install) --daemon

echo "Nix is intalled"

exec bash --rcfile ./install_packages.sh
