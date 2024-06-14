{ pkgs, ... }:
{
  home.username = "prunkles";
  home.homeDirectory = "/home/prunkles";

  home.stateVersion = "23.11";

  targets.genericLinux.enable = true;

  imports = [
    ./cli-common.nix
  ];

  nix = {
    package = pkgs.nixVersions.nix_2_18;
    settings.experimental-features = "nix-command flakes repl-flake";
  };

  programs.home-manager.enable = true;
}

