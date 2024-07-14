#!/bin/bash

# install Nix
echo "Start instaling Nix\n"
bash <(curl -L https://nixos.org/nix/install) --daemon

echo "Nix is intalled\n"

exec bash --rcfile ./install_packages.sh
