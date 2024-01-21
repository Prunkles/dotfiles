{ pkgs, nil, ... }:
{
  home.packages = [
    pkgs.lua-language-server # For neovim Lua LSP
    nil # Nix LSP
  ];
}

