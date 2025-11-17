{ pkgs, ... }:
{
  stylix = {

    iconTheme = {
      enable = true;
      package = pkgs.colloid-icon-theme;
      dark = "Colloid-Dark";
      light = "Colloid-Light";
    };

    targets = import ./targets.nix;
  };
}
