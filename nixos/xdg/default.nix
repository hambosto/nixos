{ pkgs, ... }:
{
  xdg.portal.enable = true;
  xdg.portal.configPackages = [ pkgs.hyprland ];
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
}
