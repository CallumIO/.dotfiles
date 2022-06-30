export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export _Z_DATA="$XDG_DATA_HOME/z"
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export ASDF_DATA_DIR="${XDG_DATA_HOME}"/asdf
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc 
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export EDITOR="nvim"
export VISUAL="nvim"
[ -f $XDG_CONFIG_HOME/lf/LF_ICONS ] && {
	LF_ICONS="$(tr '\n' ':' <$XDG_CONFIG_HOME/lf/LF_ICONS)" \
		&& export LF_ICONS
}
