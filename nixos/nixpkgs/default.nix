{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      inputs.mac-style-plymouth.overlays.default
    ];
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
