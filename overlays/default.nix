{ inputs, ... }:
[
  (final: prev: {
    anthropics-skills = prev.callPackage ../packages/anthropics-skills.nix { };
    docs-mcp = prev.callPackage ../packages/docs-mcp.nix { };
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
    rust-skills = prev.callPackage ../packages/rust-skills.nix { };
  })
  inputs.niri-nix.overlays.default
  inputs.nix-vscode-extensions.overlays.default
  inputs.nix-zed-extensions.overlays.default
  inputs.noctalia.overlays.default
  inputs.sweetbyte-rs.overlays.default
]
