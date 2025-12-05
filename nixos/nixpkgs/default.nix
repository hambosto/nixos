{ inputs, ... }:
{
  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
    overlays = import ../../overlays { inherit inputs; };
  };
}
