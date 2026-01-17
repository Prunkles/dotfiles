{ config, inputs, ... }:
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];
  perSystem =
    { pkgs, ... }:
    {
      # `legacyPackages` because of https://github.com/nix-community/home-manager/issues/3075#issuecomment-1477155995
      legacyPackages.homeConfigurations = {
        "prunkles@generic-server" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            (
              { ... }:
              {
                home.username = "prunkles";
                home.homeDirectory = "/home/prunkles";

                home.stateVersion = "23.11";

                targets.genericLinux.enable = true;

                imports = [
                  config.flake.modules.homeManager.nix
                  config.flake.modules.homeManager.cli-common
                ];

                programs.home-manager.enable = true;
              }
            )
          ];
        };
      };
    };
}
