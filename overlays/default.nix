{ inputs, ... }:
[
  (final: prev: {
    iwmenu = inputs.iwmenu.packages.${final.stdenv.hostPlatform.system}.default;
    obsidian-catppuccin = prev.callPackage ../packages/obsidian-catppuccin.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
    pwmenu = inputs.pwmenu.packages.${final.stdenv.hostPlatform.system}.default;
    sweetbyte = inputs.sweetbyte.packages.${final.stdenv.hostPlatform.system}.default;
    awww = inputs.awww.packages.${final.stdenv.hostPlatform.system}.awww;
  })
  (import ../packages/obsidian-builders)
  inputs.nix4vscode.overlays.default
  inputs.nur.overlays.default
  inputs.rust-overlay.overlays.default
]
