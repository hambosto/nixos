{
  inputs,
  ...
}:
{
  nixpkgs = {
    overlays = [
      (import ../../pkgs)
      inputs.nix-vscode-extensions.overlays.default
      inputs.hyprpanel.overlay
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
