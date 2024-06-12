# install nix
# curl -L https://nixos.org/nix/install | sh

# source nix
# . ~/.nix-profile/etc/profile.d/nix.sh

# install packages
# nix-env -iA \
#	nixpkgs.zsh \
#	nixpkgs.stow \
#	nixpkgs.bat \
#	nixpkgs.gnumake \
#	nixpkgs.gcc \
#	nixpkgs.starship \
#	nixpkgs.volta \
#	nixpkgs.go \
sudo pacman -Suy
sudo pacman -S zsh stow bat make gcc gopls go helix 
curl https://get.volta.sh | bash
# stow dotfiles
stow git
stow zsh
# stow starship

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER
