{ inputs, ... }:
[
  (final: prev: {
    awww = inputs.awww.packages.${prev.stdenv.hostPlatform.system}.awww;
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
  })
  inputs.niri.overlays.niri
  inputs.nix-vscode-extensions.overlays.default
]
