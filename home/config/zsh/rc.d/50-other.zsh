
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#source "$HOME/.nix-profile/share/zsh/plugins/nix/nix-zsh-completions.plugin.zsh"

export EDITOR="nvim"
alias e="$EDITOR"

alias cat="bat -p"
alias ls="eza"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

