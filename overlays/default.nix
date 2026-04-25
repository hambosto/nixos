{ inputs, ... }:
[
  (final: prev: {
    anthropics-skills = prev.callPackage ../packages/anthropics-skills.nix { };
    docs-mcp = prev.callPackage ../packages/docs-mcp.nix { };
    gcop-rs = prev.callPackage ../packages/gcop-rs.nix { };
    harmonyos-sans = prev.callPackage ../packages/harmonyos-sans.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
    rust-skills = prev.callPackage ../packages/rust-skills.nix { };
  })
  inputs.niri-nix.overlays.default
  inputs.sweetbyte-rs.overlays.default
  inputs.nix-zed-extensions.overlays.default
]
