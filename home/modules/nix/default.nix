{ pkgs, nixpkgs, ... }:
{
  nix = {
    package = pkgs.nixVersions.stable;
    settings.experimental-features = "nix-command flakes repl-flake";
    registry = {
      "nixpkgs".flake = nixpkgs;
    };
  };
}

