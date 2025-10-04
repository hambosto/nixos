{ inputs, ... }:
[
  (final: prev: {
    pokego = prev.callPackage ../packages/pokego.nix { };
  })
  inputs.nur.overlays.default
  inputs.nix4vscode.overlays.default
  inputs.nixpkgs-overlay.overlays.default
]
