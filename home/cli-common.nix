{ pkgs, ... }:
{
  imports = [
    ./modules/zsh
    ./modules/nvim
    ./modules/tmux
  ];

  home.packages = [
    pkgs.git

    pkgs.bottom
    pkgs.bat
    pkgs.eza
    pkgs.zoxide
    pkgs.starship
    pkgs.lazygit
    pkgs.delta
    pkgs.fzf
    pkgs.jq
    pkgs.tealdeer
    pkgs.fastfetch
    pkgs.libqalculate

    pkgs.ripgrep
    pkgs.fd
  ];

  home.file = {
    ".profile".source = ./profile;
  };
  xdg.configFile = {
    "lazygit".source = ./config/lazygit;
  };
}
