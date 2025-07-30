{
  inputs,
  ...
}:
{
  nixpkgs = {
    overlays = [
      (import ../../pkgs)
      inputs.nix4vscode.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
