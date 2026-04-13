{ inputs, ... }:
[
  (final: prev: {
    anthropics-skills = prev.callPackage ../packages/anthropics-skills.nix { };
    docs-mcp = prev.callPackage ../packages/docs-mcp.nix { };
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
    rust-skills = prev.callPackage ../packages/rust-skills.nix { };
  })
  inputs.niri.overlays.niri
  inputs.nix-vscode-extensions.overlays.default
  inputs.sweetbyte-rs.overlays.default
]
