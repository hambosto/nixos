{
  inputs,
  ...
}:
{
  nixpkgs = {
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
      inputs.rust-overlay.overlays.default
      inputs.hyprpanel.overlay
    ];
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
}
