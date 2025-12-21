{ pkgs, ... }:
{
  xdg.portal.enable = true;
  xdg.portal.configPackages = [ pkgs.niri-unstable ];
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
}
