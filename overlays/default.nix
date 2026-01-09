{ inputs, ... }:
[
  (final: prev: {
    awww = prev.callPackage ../packages/awww.nix { };
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
  })
  inputs.niri.overlays.niri
  inputs.nix-vscode-extensions.overlays.default
]
