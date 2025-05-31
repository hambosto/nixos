{
  nixpkgs = {
    overlays = [ (import ../../pkgs) ];
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
