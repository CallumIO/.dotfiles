# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ];
 then . ~/.nix-profile/etc/profile.d/nix.sh; fi

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export _Z_DATA="$XDG_DATA_HOME/z"
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# load compdef
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# source plugins
. $XDG_CONFIG_HOME/antidote/antidote.zsh
source <(antidote init)
#antidote load
antidote bundle <$XDG_CONFIG_HOME/zsh/zsh_plugins.txt >$XDG_CONFIG_HOME/zsh/zsh_plugins.zsh

alias cat="bat"

. /opt/asdf-vm/asdf.sh
ASDF_BIN="${ASDF_DIR}/bin"
ASDF_USER_SHIMS="${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
[[ ":$PATH:" == *":${ASDF_BIN}:"* ]] && PATH="${PATH//$ASDF_BIN:/}"
[[ ":$PATH:" == *":${ASDF_USER_SHIMS}:"* ]] && PATH="${PATH//$ASDF_USER_SHIMS:/}"
PATH="${ASDF_BIN}:$PATH"
PATH="${ASDF_USER_SHIMS}:$PATH"

[[ ! -f $XDG_CONFIG_HOME/zsh/p10k.zsh ]] || source $XDG_CONFIG_HOME/zsh/p10k.zsh

source $XDG_CONFIG_HOME/zsh/zsh_plugins.zsh

if [ -e /home/callum/.nix-profile/etc/profile.d/nix.sh ]; then . /home/callum/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval $(thefuck --alias)

alias ls='ls -a --color=auto'
alias ll='ls -al --color=auto'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

neofetch
