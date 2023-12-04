
source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR="nvim"
alias e="$EDITOR"

alias cat="bat -p"
alias ls="eza"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

