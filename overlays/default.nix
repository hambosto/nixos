{ inputs, ... }:
[
  (final: prev: {
    iwmenu = inputs.iwmenu.packages.${final.system}.default;
    obsidian-catppuccin = prev.callPackage ../packages/obsidian-catppuccin.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
    pwmenu = inputs.pwmenu.packages.${final.system}.default;
    sweetbyte = inputs.sweetbyte.packages.${final.system}.default;
    swww = inputs.swww.packages.${final.system}.swww;
  })
  (import ../packages/obsidian-builders)
  inputs.nix4vscode.overlays.default
  inputs.nur.overlays.default
]
