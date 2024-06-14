{
  description = "Home Manager configuration of prunkles";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    nil = {
      url = "github:oxalica/nil";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, home-manager, flake-parts, nil, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];
      perSystem = { pkgs, system, ... }:
        {
          # `legacyPackages` because of https://github.com/nix-community/home-manager/issues/3075#issuecomment-1477155995
          legacyPackages.homeConfigurations = {
            "prunkles@p-pc" = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [
                "${./.}/home/hosts/prunkles@p-pc"
              ];
              extraSpecialArgs = {
                inherit nixpkgs;
                nil = nil.packages.${system}.nil;
              };
            };
            "prunkles@generic-server" = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [
                "${./.}/home/hosts/prunkles@generic-server"
              ];
              extraSpecialArgs = {
                inherit nixpkgs;
              };
            };
          };
        };
    };
}

