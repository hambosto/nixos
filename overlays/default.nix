{ inputs, ... }:
[
  (final: prev: {
    awww = inputs.awww.packages.${final.stdenv.hostPlatform.system}.default;
    nmgui = prev.callPackage ../packages/nmgui.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
    sweetbyte = inputs.sweetbyte.packages.${final.stdenv.hostPlatform.system}.default;
  })
  inputs.font-collections.overlays.default
  inputs.niri.overlays.niri
  inputs.nix-vscode-extensions.overlays.default
  inputs.nur.overlays.default
  inputs.zed-extensions.overlays.default
]
