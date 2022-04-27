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
        nixpkgs.fzf \
        nixpkgs.stow

# install development packages
nix-env -iA \
        nixpkgs.asdf-vm

# stow config files
stow asdf
stow git
stow zsh

# setup zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

sudo apt-get install \
            make \
            build-essential \
            libssl-dev \
            zlib1g-dev \
            libbz2-dev \
            libreadline-dev \
            libsqlite3-dev \
            wget \
            curl \
            llvm \
            libncursesw5-dev \
            xz-utils \
            tk-dev \
            libxml2-dev \
            libxmlsec1-dev \
            libffi-dev \
            liblzma-dev

asdf plugin add nodejs
asdf plugin add python
asdf plugin add rust

asdf install