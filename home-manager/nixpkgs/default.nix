{
  inputs,
  ...
}:
{
  nixpkgs = {
    overlays = [
      (import ../../pkgs)
      inputs.nix-vscode-extensions.overlays.default
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
