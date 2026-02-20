{ inputs, ... }:
[
  (final: prev: {
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
  })
  inputs.nix-vscode-extensions.overlays.default
]
