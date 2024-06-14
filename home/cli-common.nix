{ pkgs, ... }:
{
  imports = [
    ./modules/zsh
    ./modules/nvim
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
    pkgs.neofetch

    pkgs.tmux
    pkgs.tmuxPlugins.sensible
    pkgs.tmuxPlugins.catppuccin
    pkgs.tmuxPlugins.vim-tmux-navigator
    pkgs.tmuxPlugins.resurrect

    pkgs.ripgrep
    pkgs.fd
  ];

  home.file = {
    ".profile".source = ./profile;
  };
  xdg.configFile = {
    "tmux".source = ./config/tmux;
    "lazygit".source = ./config/lazygit;
  };
}

