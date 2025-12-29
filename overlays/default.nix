{ inputs, ... }:
[
  (final: prev: {
    awww = inputs.awww.packages.${final.stdenv.hostPlatform.system}.default;
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
  })
  inputs.niri.overlays.niri
  inputs.nix-vscode-extensions.overlays.default
]
