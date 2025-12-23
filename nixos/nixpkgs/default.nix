{ inputs, ... }:
{
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = import ../../overlays { inherit inputs; };
}
