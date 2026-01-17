{ ... }:
{
  flake.modules.homeManager.nvim =
    { lib, pkgs, ... }:
    {
      home.packages = [
        pkgs.tree-sitter
      ];

      programs.neovim = {
        enable = true;
        extraPackages = [
          pkgs.gcc # For treesitter compilation
        ];
      };

      xdg.configFile = {
        "nvim".source = ./_config/nvim;
      };

      home.activation = {
        checkNvimLazyNvimLock = lib.hm.dag.entryBefore [ "linkGeneration" ] ''
          lazyNvimLock="$HOME/.local/share/nvim/lazy/lazy-lock.json"
          if [ -f "$lazyNvimLock" ]; then
              if ! cmp --silent "${./_config/nvim/lazy-lock.json}" "$lazyNvimLock"; then
                  _iError "lazy.nvim lock file at '$lazyNvimLock' already exists and differs from expected. Remove it or update it in dotfiles"
                  exit 1
              fi
          fi
        '';
        writeNvimLazyNvimLock = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          $DRY_RUN_CMD mkdir $VERBOSE_ARG -p "$(dirname "$lazyNvimLock")"
          $DRY_RUN_CMD cp $VERBOSE_ARG --no-preserve=mode "${./_config/nvim/lazy-lock.json}" "$lazyNvimLock"
        '';
      };
    };
}
