{ config, pkgs, ... }:
let
  vimPluginPkg = pluginPkg:
    pkgs.stdenv.mkDerivation {
      name = "${pluginPkg.name}-lhs-share";
      dontUnpack = true;
      installPhase = ''
        target="$out/share/vim-plugins/${pluginPkg.src.owner}/${pluginPkg.src.repo}"
        mkdir -p "$(dirname "$target")"
        ln -s "${pluginPkg}" "$target"
      '';
    };
in {
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
    (vimPluginPkg pkgs.vimPlugins.lazy-nvim) # folke/lazy.nvim
    (vimPluginPkg pkgs.vimPlugins.neodev-nvim) # folke/neodev-nvim
    (vimPluginPkg pkgs.vimPlugins.catppuccin-nvim) # catppuccin/nvim
    (vimPluginPkg pkgs.vimPlugins.nvim-lspconfig) # neovim/nvim-lspconfig
    (vimPluginPkg pkgs.vimPlugins.nvim-cmp) # hrsh7th/nvim-cmp
      (vimPluginPkg pkgs.vimPlugins.luasnip) # L3MON4D3/LuaSnip
      (vimPluginPkg pkgs.vimPlugins.cmp_luasnip) # saadparwaiz1/cmp_luasnip
      (vimPluginPkg pkgs.vimPlugins.cmp-nvim-lsp) # hrsh7th/cmp-nvim-lsp
      (vimPluginPkg pkgs.vimPlugins.friendly-snippets) # rafamadriz/friendly-snippets
    (vimPluginPkg pkgs.vimPlugins.vim-tmux-navigator) # christoomey/vim-tmux-navigator
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
