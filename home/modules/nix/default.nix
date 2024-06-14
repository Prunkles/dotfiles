{ pkgs, nixpkgs, ... }:
{
  nix = {
    package = pkgs.nixVersions.nix_2_18;
    settings.experimental-features = "nix-command flakes repl-flake";
    registry = {
      "nixpkgs".flake = nixpkgs;
    };
  };
}

