{ inputs, ... }:
[
  (final: prev: {
    crates-docs = prev.callPackage ../packages/crates-docs.nix { };
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
  })
  inputs.nix-vscode-extensions.overlays.default
  inputs.noctalia.overlays.default
  inputs.sweetbyte.overlays.default
]
