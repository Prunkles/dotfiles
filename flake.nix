{
  description = "Home Manager configuration of prunkles";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    import-tree.url = "github:vic/import-tree";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.import-tree ./modules) ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        {
          # `legacyPackages` because of https://github.com/nix-community/home-manager/issues/3075#issuecomment-1477155995
          legacyPackages.homeConfigurations = {
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
