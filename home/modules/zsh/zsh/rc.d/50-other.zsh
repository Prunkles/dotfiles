
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=100000

source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR="$HOME/.nix-profile/bin/nvim"
alias e="$EDITOR"

alias cat="bat -p"
alias ls="eza"

alias lazygit="EDITOR=nvim lazygit" # Because lazygit uses editor based on the hard-coded EDITOR values
alias lg="lazygit"

export LANG=C.UTF-8 # https://github.com/nix-community/home-manager/issues/3711#issuecomment-1748480665
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

# fzf

source ~/.nix-profile/share/fzf/key-bindings.zsh
source ~/.nix-profile/share/fzf/completion.zsh

