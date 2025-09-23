final: prev: {
  iwmenu = prev.callPackage ./iwmenu.nix { };
  pokego = prev.callPackage ./pokego.nix { };
  sweetbyte = prev.callPackage ./sweetbyte.nix { };
}
