{ inputs, ... }:
[
  (final: prev: {
    docs-mcp = prev.callPackage ../packages/docs-mcp.nix { };
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
  })
  inputs.niri.overlays.niri
  inputs.nix-vscode-extensions.overlays.default
]
