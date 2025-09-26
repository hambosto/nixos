{ inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.nix4vscode.overlays.default
      inputs.nur.overlays.default
    ]
    ++ [ (import ../../pkgs) ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
