{ ... }:
{
  home.username = "prunkles";
  home.homeDirectory = "/home/prunkles";

  home.stateVersion = "23.11";

  targets.genericLinux.enable = true;

  imports = [
    ./cli-common.nix
  ];

  xdg.configFile = {
    "nix" = {
      source = ./config/nix;
      recursive = true;
    };
  };

  programs.home-manager.enable = true;
}

