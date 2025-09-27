{ config, ... }:
{
  services.polkit-gnome.enable = config.wayland.windowManager.hyprland.enable;
}
