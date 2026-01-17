{ config, ... }:
{
  flake.modules.homeManager.cli-common =
    { pkgs, ... }:
    {
      imports = [
        config.flake.modules.homeManager.zsh
        config.flake.modules.homeManager.nvim
        config.flake.modules.homeManager.tmux
        config.flake.modules.homeManager.lazygit
      ];

      home.packages = [
        pkgs.git

        pkgs.bottom
        pkgs.bat
        pkgs.eza
        pkgs.zoxide
        pkgs.starship
        pkgs.fzf
        pkgs.jq
        pkgs.tealdeer
        pkgs.fastfetch
        pkgs.libqalculate

        pkgs.ripgrep
        pkgs.fd
      ];

      home.file = {
        ".profile".source = ./_config/profile;
      };
    };
}
