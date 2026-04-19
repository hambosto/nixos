{ inputs, pkgs, ... }:
{
  imports = [ inputs.niri-nix.nixosModules.niri ];

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;
}
