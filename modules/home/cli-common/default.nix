{ config, ... }:
{
  flake.modules.homeManager.cli-common =
    { lib, pkgs, ... }:
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
        pkgs.jq
        pkgs.tealdeer
        pkgs.fastfetch
        pkgs.libqalculate

        pkgs.ripgrep
        pkgs.fd
      ];

      programs.yazi.enable = true;

      programs.starship = {
        enable = true;
      };

      programs.zoxide = {
        enable = true;
      };

      programs.fzf = {
        enable = true;
      };

      programs.zsh = {
        initContent = lib.mkBefore ''
          export LC_CTYPE=C.UTF-8 # https://github.com/nix-community/home-manager/issues/3711#issuecomment-2156138972
        '';
        shellAliases = {
          "cat" = "bat -p";
          "ls" = "eza";
        };
      };
    };
}
