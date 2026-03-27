
# 1. Tell Zsh where the rest of the config is
export ZDOTDIR="$HOME/.config/zsh"

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='firefox'
export TERMINAL="ghostty"
export TERM="xterm-ghostty"

# 2. Setup XDG Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# 3. Fix the Directory Errors (The mkdir logic)
[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# 4. History & Cache Locations
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

