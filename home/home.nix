{ config, pkgs, ... }:

{
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
  home.stateVersion = "23.05"; # Please read the comment before changing.

  targets.genericLinux.enable = true;

  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    #pkgs.zsh
    pkgs.oh-my-zsh
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.bottom
    pkgs.bat
    pkgs.eza
    pkgs.zoxide
    pkgs.starship
    pkgs.lazygit
  ];

  home.file = {
    ".profile".source = ./profile;
    ".zshrc".source = ./zshrc;
  };
  xdg.configFile = {
    "zsh".source = ./config/zsh;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
