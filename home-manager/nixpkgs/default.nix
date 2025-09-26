{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      (import ../../pkgs)
      inputs.nix4vscode.overlays.default
      inputs.nur.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
