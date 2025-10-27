{ config, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [ config.home-manager.users.ilham.wayland.windowManager.hyprland.portalPackage ];
    configPackages = [ config.home-manager.users.ilham.wayland.windowManager.hyprland.package ];
  };
}
