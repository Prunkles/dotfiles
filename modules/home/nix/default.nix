{ inputs, ... }:
{
  flake.modules.homeManager.nix =
    { pkgs, ... }:
    {
      nix = {
        package = pkgs.nixVersions.stable;
        settings.experimental-features = "nix-command flakes";
        registry = {
          "nixpkgs".flake = inputs.nixpkgs;
        };
      };
    };
}
