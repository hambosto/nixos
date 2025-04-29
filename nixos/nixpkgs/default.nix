{
  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
