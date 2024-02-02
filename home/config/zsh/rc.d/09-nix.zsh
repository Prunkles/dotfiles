
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

source ~/.nix-profile/share/zsh/plugins/nix/init.zsh

# NOTE: Relies on someone calling compinit later

