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
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, home-manager, flake-parts, nil, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];
      perSystem = { pkgs, system, ... }:
        {
          # `legacyPackages` because of https://github.com/nix-community/home-manager/issues/3075#issuecomment-1477155995
          legacyPackages.homeConfigurations = {
            "prunkles" = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;

              # Specify your home configuration modules here, for example,
              # the path to your home.nix.
              modules = [ ./home/home.nix ];

              # Optionally use extraSpecialArgs
              # to pass through arguments to home.nix
              extraSpecialArgs = { 
                nil = nil.packages.${system}.nil;
              };
            };
            "prunkles@generic-server" = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [ ./home/home-generic-server.nix ];
            };
          };
        };
    };
}

