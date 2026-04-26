{ ... }:
{
  flake.modules.homeManager.dev-dotnet-fsharp =
    { pkgs, ... }:
    {
      # imports = [
      #   {
      #     # https://github.com/hercules-ci/flake-parts/pull/251
      #     key = "${flake-config._module.specialArgs.moduleLocation}#modules.homeManager.dev-dotnet";
      #     imports = [
      #       flake-config.flake.modules.homeManager.dev-dotnet
      #     ];
      #   }
      # ];

      home.packages = [
        pkgs.fsautocomplete # For neovim F# LSP
      ];
      programs.zsh.initContent = ''
        export DOTNET_NEW_PREFERRED_LANG="F#"
        alias fsi="dotnet fsi --nologo --consolecolors+"
      '';
    };
}
