{ inputs, ... }:
[
  (final: prev: {
    awww = inputs.awww.packages.${final.stdenv.hostPlatform.system}.awww;
    nmgui = prev.callPackage ../packages/nmgui.nix { };
    obsidian-catppuccin = prev.callPackage ../packages/obsidian-catppuccin.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
    sweetbyte = inputs.sweetbyte.packages.${final.stdenv.hostPlatform.system}.default;
  })
  (import ../packages/obsidian-builders)
  inputs.nix4vscode.overlays.default
  inputs.nur.overlays.default
]
