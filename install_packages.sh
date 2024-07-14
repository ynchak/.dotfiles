#!/bin/bash

echo "Start instaling packages..."

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.stow \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.starship \
	nixpkgs.volta \
	nixpkgs.go \
	nixos.helix

echo "Packages are installed"
# stow dotfiles
echo "Stow dotfiles"
stow git
stow zsh
stow starship

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER
