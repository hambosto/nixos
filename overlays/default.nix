{ inputs, ... }:
[
  (final: prev: {
    pokego = prev.callPackage ../packages/pokego.nix { };
    sweetbyte = prev.callPackage ../packages/sweetbyte.nix { };
  })
  inputs.nur.overlays.default
  inputs.nix4vscode.overlays.default
  inputs.nixpkgs-overlay.overlays.default
]
