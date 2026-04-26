{ ... }:
{
  flake.modules.homeManager.kitty =
    { ... }:
    {
      programs.zsh.initContent = ''
        # kitty
        [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
      '';
    };
}
