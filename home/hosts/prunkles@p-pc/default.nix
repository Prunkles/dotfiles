{ pkgs, ... }: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "prunkles";
  home.homeDirectory = "/home/prunkles";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  targets.genericLinux.enable = true;

  imports = [
    ../../cli-common.nix
    ../../dev-common.nix
  ];

  nix = {
    package = pkgs.nixVersions.nix_2_18;
    settings.experimental-features = "nix-command flakes repl-flake";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
