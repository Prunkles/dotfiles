{ ... }:
{
  flake.modules.homeManager.dev-dotnet =
    { ... }:
    {
      programs.zsh.initContent = ''
        export PATH="$PATH:$HOME/.dotnet/tools"
        # https://aka.ms/dotnet-cli-telemetry
        export DOTNET_CLI_TELEMETRY_OPTOUT=1
      '';
    };
}
