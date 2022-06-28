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
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

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

export LF_ICONS="\
	tw=:\
	st=:\
	ow=:\
	dt=:\
	di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

neofetch
