{ inputs, ... }:
{
  nixpkgs.overlays = import ../../overlays { inherit inputs; };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
}
