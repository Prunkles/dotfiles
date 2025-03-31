{ pkgs, ... }:
{
  home.packages = [
    pkgs.lua-language-server # For neovim Lua LSP

    pkgs.nixd # Nix LSP
    pkgs.nvd
    pkgs.nix-output-monitor
    pkgs.nix-tree
  ];

  programs.direnv = {
    enable = true;
    #enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}

