{ pkgs, lib, ... }:
{
  home.packages = [
    pkgs.gcc # For tree-sitter

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
    pkgs.delta

    pkgs.tmux
    pkgs.tmuxPlugins.sensible
    pkgs.tmuxPlugins.catppuccin
    pkgs.tmuxPlugins.vim-tmux-navigator

    pkgs.neovim
    pkgs.tree-sitter
    pkgs.ripgrep
    pkgs.fd
  ];

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
      $DRY_RUN_CMD mkdir $VERBOSE_ARG -p "$(dirname "$lazyNvimLock")"
      $DRY_RUN_CMD cp $VERBOSE_ARG --no-preserve=mode "${./config/nvim/lazy-lock.json}" "$lazyNvimLock"
    '';
  };

  home.file = {
    ".zshrc".source = ./zshrc;
  };
  xdg.configFile = {
    "zsh".source = ./config/zsh;
    "nvim".source = ./config/nvim;
    "tmux".source = ./config/tmux;
    "lazygit" = {
      source = ./config/lazygit;
      recursive = true; # because there is a mutable ./state.yml file in the configs. See https://github.com/jesseduffield/lazygit/pull/2936
    };
  };
}

