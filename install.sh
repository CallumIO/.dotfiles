# install nix package manager
curl -L https://nixos.org/nix/install | sh

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
        nixpkgs.stow \
        nixpkgs.tmux \
	nixos.thefuck

# install development packages
nix-env -iA \
        nixpkgs.asdf-vm

# stow config files
stow asdf
stow git
stow zsh
stow tmux

# setup zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

packages="make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev"

if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packages
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $packages
elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packages
elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packages
elif [ -x "$(command -v yum)" ];  then sudo yum install $packages
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; fi

asdf plugin add nodejs
asdf plugin add python
asdf plugin add rust
asdf plugin add perl

asdf install

source /home/callum/.asdf/installs/rust/1.60.0/env
tmux source ~/.tmux.conf
