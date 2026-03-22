
[[ -f "$ZDOTDIR/exports.zsh" ]] && source "$ZDOTDIR/exports.zsh"

# load modules
zmodload zsh/complist
autoload -U compinit 
autoload -U colors

# Tell compinit exactly where to put the dump file (Cache, not Config)
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$HOST-$ZSH_VERSION"

# cmp opts
zstyle ':completion:*' menu select 
zstyle ':completion:*' special-dirs true 
zstyle ':completion:*' squeeze-slashes false 
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# main opts
bindkey -v

setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# HISTORY SETTINGS
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS  # Don't record duplicates
setopt HIST_REDUCE_BLANKS    # Remove wasted space

# PROMPT
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
eval "$(starship init zsh)"

# MODULAR FILES
[[ -f "$ZDOTDIR/aliases.zsh" ]] && source "$ZDOTDIR/aliases.zsh"
[[ -f "$ZDOTDIR/prompt.zsh" ]] && source "$ZDOTDIR/prompt.zsh"
[[ -f "$ZDOTDIR/plugins.zsh" ]] && source "$ZDOTDIR/plugins.zsh"

#fun
# autoload -U tetris # main attraction of zsh, obviously

