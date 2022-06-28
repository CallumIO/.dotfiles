# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ];
 then . ~/.nix-profile/etc/profile.d/nix.sh; fi

# load compdef
autoload -Uz compinit
compinit

# source plugins
. ~/.antidote/antidote.zsh
source <(antidote init)
antidote load
antidote bundle < ~/.zsh_plugins.txt

alias cat="bat"

. /opt/asdf-vm/asdf.sh
ASDF_BIN="${ASDF_DIR}/bin"
ASDF_USER_SHIMS="${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
[[ ":$PATH:" == *":${ASDF_BIN}:"* ]] && PATH="${PATH//$ASDF_BIN:/}"
[[ ":$PATH:" == *":${ASDF_USER_SHIMS}:"* ]] && PATH="${PATH//$ASDF_USER_SHIMS:/}"
PATH="${ASDF_BIN}:$PATH"
PATH="${ASDF_USER_SHIMS}:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh_plugins.zsh

if [ -e /home/callum/.nix-profile/etc/profile.d/nix.sh ]; then . /home/callum/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval $(thefuck --alias)

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
alias ls='ls -a --color=auto'
alias ll='ls -al --color=auto'

neofetch
