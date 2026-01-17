{ ... }:
{
  flake.modules.homeManager.lazygit =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.delta
        pkgs.lazygit
      ];
      xdg.configFile = {
        "lazygit".source = ./_config/lazygit;
      };
    };
}
