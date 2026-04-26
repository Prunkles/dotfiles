{ ... }:
{
  flake.modules.homeManager.zsh =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      home.packages = [
        pkgs.zsh-completions
      ];

      programs.zsh = {
        enable = true;

        history.size = 100000;
        history.path = "${config.xdg.stateHome}/zsh/history";

        initContent = lib.mkMerge [
          (lib.mkBefore ''
            export PATH="$PATH:$HOME/.local/bin"

            # XDG
            export XDG_DATA_HOME="$HOME/.local/share"
            export XDG_CONFIG_HOME="$HOME/.config"
            export XDG_STATE_HOME="$HOME/.local/state"
            export XDG_CACHE_HOME="$HOME/.cache"
            export XDG_DATA_DIRS="$XDG_DATA_DIRS:$XDG_DATA_HOME"
          '')
          ''
            # <xdg-ninja-antidot>
            # [docker]: $HOME/.docker
            export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
            # [go]: $HOME/go
            export GOPATH="$XDG_DATA_HOME"/go
            # [postgresql]: $HOME/.psql_history
            export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
            # </xdg-ninja-antidot>
          ''
        ];

        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "dotnet"
            "npm"
            "vscode"
          ];
          extraConfig = ''
            COMPLETION_WAITING_DOTS="true"
          '';
        };
      };
    };
}
