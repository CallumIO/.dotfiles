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
