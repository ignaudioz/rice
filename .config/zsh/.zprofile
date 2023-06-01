#Exports 

# General
#
export TERMINAL="st"
export BROWSER="librewolf"
export FILE="lf"
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export HISTFILE="$XDG_DATA_HOME/history"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

export ZDOT="/home/audioz/.config/zsh/"
export PATH=$PATH:~/.local/bin:
export LC_ALL=en_US.UTF-8

# Java
export JDTLS_HOME="/usr/share/java/jdtls"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
