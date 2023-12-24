{ config, pkgs, lib, ... }: {
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

  home.activation = {
    checkNvimLazyNvimLock = lib.hm.dag.entryBefore ["linkGeneration"] ''
      lazyNvimLock="$HOME/.local/share/nvim/lazy/lazy-lock.json"
      if [ -f "$lazyNvimLock" ]; then
          if ! cmp --silent "${./config/nvim/lazy-lock.json}" "$lazyNvimLock"; then
              _iError "lazy.nvim lock file at '$lazyNvimLock' already exists and differs from expected. Remove it or update it in dotfiles"
              exit 1
          fi
      fi
    '';
    writeNvimLazyNvimLock = lib.hm.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD cp $VERBOSE_ARG --no-preserve=mode "${./config/nvim/lazy-lock.json}" "$lazyNvimLock"
    '';
  };

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

    pkgs.zsh
    pkgs.oh-my-zsh
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.nix-zsh-completions

    pkgs.bottom
    pkgs.bat
    pkgs.eza
    pkgs.zoxide
    pkgs.starship
    pkgs.lazygit

    pkgs.tmux
    pkgs.tmuxPlugins.sensible
    pkgs.tmuxPlugins.catppuccin
    pkgs.tmuxPlugins.vim-tmux-navigator

    pkgs.neovim
    pkgs.lua-language-server # For neovim Lua LSP
  ];

  home.file = {
    ".profile".source = ./profile;
    ".zshrc".source = ./zshrc;
  };
  xdg.configFile = {
    "nix".source = ./config/nix;
    "zsh".source = ./config/zsh;
    "nvim".source = ./config/nvim;
    "tmux".source = ./config/tmux;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
