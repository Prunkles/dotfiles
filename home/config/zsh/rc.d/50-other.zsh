
source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR="$HOME/.nix-profile/bin/nvim"
alias e="$EDITOR"

alias cat="bat -p"
alias ls="eza"

alias lg="lazygit"

export LANG=C.UTF-8 # https://github.com/nix-community/home-manager/issues/3711#issuecomment-1748480665
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

# fzf

source ~/.nix-profile/share/fzf/key-bindings.zsh
source ~/.nix-profile/share/fzf/completion.zsh

