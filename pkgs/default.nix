final: prev: {
  hexwarden = prev.callPackage ./hexwarden.nix { };
  pokego = prev.callPackage ./pokego.nix { };
}
