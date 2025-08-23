final: prev: {
  iwmenu = prev.callPackage ./iwmenu.nix { };
  nextia-mono = prev.callPackage ./nextia-mono.nix { };
  pokego = prev.callPackage ./pokego.nix { };
  sweetbyte = prev.callPackage ./sweetbyte.nix { };
}
