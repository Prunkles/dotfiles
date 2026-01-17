{ pkgs, nixpkgs, ... }:
{
  nix = {
    package = pkgs.nixVersions.stable;
    settings.experimental-features = "nix-command flakes";
    registry = {
      "nixpkgs".flake = nixpkgs;
    };
  };
}
