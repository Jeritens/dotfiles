# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../../'
alias spotify='spotatui'


alias ls='ls -a --color=auto'
# alias ll='ls -a --color=auto'
alias ll='ls' 
alias l='ls -lah --color=auto'
# alias cat='bat'           # Requires 'bat' package
# alias grep='rg'           # Requires 'ripgrep' package

# CachyOS / Arch Specifics
# alias update='sudo cachyos-rate-mirrors && local-yay' # Example update command
# alias pkg='pacman -Slq | fzf --preview "pacman -Si {1}" --xargs -I {} sudo pacman -S {}' # Interactive installer

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias wetter='curl wttr.in/berlin'
alias cheat='curl cht.sh'
