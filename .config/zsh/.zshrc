#! /bin/bash
#	  ____ ___  ______/ (_)___  ____
#	 / __ `/ / / / __  / / __ \/_  /
#	/ /_/ / /_/ / /_/ / / /_/ / / /_
#	\__,_/\__,_/\__,_/_/\____/ /___/

# Starting with zsh ;)                          
                          
autoload -U colors && colors

# PROMPT="%~ λ%{$reset_color%} "
# PROMPT="%{$fg[blue]%}%~ %{$fg_bold[white]%}>%{$reset_color%} "

# PROMPT="%{$fg_bold[white]%}✪ %{$fg_bold[black]%}[%{$fg_bold[white]%}%~%{$fg_bold[black]%}] 
# %{$fg_bold[black]%}→ %{$reset_color%} "
PROMPT="%{$fg_bold[gray]%}[%{$fg_bold[white]%}%~%{$fg_bold[gray]%}] %{$fg[white]%}> %{$reset_color%}"

setopt autocd # entering location will auto cd to it

# History
[ -e "$HOME/.cache/zsh/history" ] && HISTFILE=~/.cache/zsh/history
[ -e "$XDG_CONFIG_HOME/zsh/setopts" ] && source "$XDG_CONFIG_HOME/zsh/setopts"
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
autoload -Uz compinit && compinit

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Fix backspace bug

# fzf on history
bindkey "^?" backward-delete-char
histfzf() { tac $HISTFILE | fzf; zle redisplay }
zle -N histfzf
bindkey '^f' histfzf

# Syntax highlighting !
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
[ -e "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null

# Load shit
[ -e "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliasrc"
[ -e  "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/highlightzsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/highlightzsh"

# Color scheme
# (cat ~/.cache/wal/sequences &)

# Neofetch
[[ $(pidof $TERMINAL | wc -w) < 3 ]] && neofetch
