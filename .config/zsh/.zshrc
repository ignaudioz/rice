#! /bin/zsh
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

# History
[ -e "$HOME/.cache/zsh/history" ] && HISTFILE=~/.cache/zsh/history
# loading setopts
[ -e "$XDG_CONFIG_HOME/shell/setopts" ] && source "$XDG_CONFIG_HOME/shell/setopts"

HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
autoload -Uz compinit && compinit

# Syntax highlighting !
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
[ -e "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null
# Autosuggestions 
[ -e "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" 2>/dev/null

# Other Settings # 
# Binds
[ -e "${XDG_CONFIG_HOME:-$HOME/.config}/shell/binds" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/binds"
# Alias
[ -e "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
# Zsh Highlight plugin
[ -e  "${XDG_CONFIG_HOME:-$HOME/.config}/shell/highlightzsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/highlightzsh"

# Color scheme
# (cat ~/.cache/wal/sequences &)

# Neofetch
[[ $(pidof $TERMINAL | wc -w) < 3 ]] && neofetch
