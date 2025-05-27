{ pkgs, ... }:
{
  home.packages = [
    pkgs.tmux
    pkgs.tmuxPlugins.sensible
    pkgs.tmuxPlugins.catppuccin
    pkgs.tmuxPlugins.vim-tmux-navigator
    pkgs.tmuxPlugins.resurrect
  ];

  xdg.configFile = {
    "tmux".source = ./config-tmux;
  };
}
