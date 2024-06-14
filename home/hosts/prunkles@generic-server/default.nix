{ ... }:
{
  home.username = "prunkles";
  home.homeDirectory = "/home/prunkles";

  home.stateVersion = "23.11";

  targets.genericLinux.enable = true;

  imports = [
    ../../modules/nix
    ../../cli-common.nix
  ];

  programs.home-manager.enable = true;
}

