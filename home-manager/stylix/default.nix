{ pkgs, ... }:
{
  stylix = {

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus";
      light = "Papirus";
    };

    targets = import ./targets.nix;
  };
}
