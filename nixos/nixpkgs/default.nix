{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      (import ../../pkgs)
      inputs.nur.overlays.default
    ];
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
