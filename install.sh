# install nix package manager
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install environment packages
nix-env -iA \
        nixpkgs.git \
        nixpkgs.zsh \
        nixpkgs.stow \
        nixpkgs.bat \
        nixpkgs.direnv \
        nixpkgs.antibody \
        nixpkgs.fzf 

# install development packages
nix-env -iA \
        nixpkgs.asdf-vm

# setup zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# git config
git config --global user.email "github@cleslie.uk"
git config --global user.name "Callum Leslie"
