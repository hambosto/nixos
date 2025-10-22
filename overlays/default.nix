{ inputs, ... }:
[
  (final: prev: {
    obsidian-catppuccin = prev.callPackage ../packages/obsidian-catppuccin.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
  })
  (import ../packages/obsidian-builders)
  inputs.nur.overlays.default
  inputs.nix4vscode.overlays.default
  inputs.mynixpkgs.overlays.default
]
