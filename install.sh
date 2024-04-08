#!/bin/bash
sshFolder="~/.ssh"

if [ -d "$sshFolder" ]; then
    # Виконання скрипту
    echo "start ssh-agent"
    # Add ssh
    sudo chmod 700 ~/.ssh
    sudo chmod 644 ~/.ssh/id_ed25519.pub
    sudo chmod 600 ~/.ssh/id_ed25519
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519

else
    echo "skip"
fi
echo "install nix"
# install nix
curl -L https://nixos.org/nix/install | sh

echo "source nix"
# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

echo "install packages"
# install packages
nix-env -iA
	nixpkgs.zsh \
        nixpkgs.stow \
        nixpkgs.bat \
        nixpkgs.gnumake \
        nixpkgs.gcc \
        nixpkgs.starship \
        nixpkgs.volta \
        nixpkgs.go \

echo "stow dotfiles"
# stow dotfiles
stow git
stow zsh
stow starship

echo "add zsh as a login shell"
# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells


echo "use zsh as default shell"
# use zsh as default shell
sudo chsh -s $(which zsh) $USER

echo "complete"
