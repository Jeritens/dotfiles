plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search  
)

for plugin in $plugins; do
    plugin_path="/usr/share/zsh/plugins/$plugin/$plugin.zsh"

    if [[ -f "$plugin_path" ]]; then
        source "$plugin_path"
    elif [[ -f "/usr/share/zsh/plugins/$plugin.zsh" ]]; then
        source "/usr/share/zsh/plugins/$plugin.zsh"
    else
        echo "Warning: Plugin $plugin not found at $plugin_path"
    fi
done
