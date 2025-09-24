final: prev: {
  iwmenu = prev.callPackage ./iwmenu.nix { };
  pokego = prev.callPackage ./pokego.nix { };
  pwmenu = prev.callPackage ./pwmenu.nix { };
  sweetbyte = prev.callPackage ./sweetbyte.nix { };
}
