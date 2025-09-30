{ inputs, ... }:
[
  (final: prev: {
    pokego = prev.callPackage ../packages/pokego.nix { };
    sweetbyte = prev.callPackage ../packages/sweetbyte.nix { };
    pwmenu = inputs.pwmenu.packages.x86_64-linux.default;
    iwmenu = inputs.iwmenu.packages.x86_64-linux.default;
  })
  inputs.nur.overlays.default
  inputs.nix4vscode.overlays.default
]
