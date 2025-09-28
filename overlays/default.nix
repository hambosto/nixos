{ inputs, ... }:
[
  (final: prev: {
    iwmenu = prev.callPackage ../packages/iwmenu.nix { };
    pokego = prev.callPackage ../packages/pokego.nix { };
    pwmenu = prev.callPackage ../packages/pwmenu.nix { };
    sweetbyte = prev.callPackage ../packages/sweetbyte.nix { };
  })
  inputs.nur.overlays.default
  inputs.nix4vscode.overlays.default
]
