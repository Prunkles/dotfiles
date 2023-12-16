
alias nix="nix --extra-experimental-features nix-command"

fpath=(
    ~/.nix-profile/share/zsh/site-functions
    "${fpath[@]}"
)

source ~/.nix-profile/share/zsh/plugins/nix/init.zsh

# NOTE: Relies on someone calling compinit later

