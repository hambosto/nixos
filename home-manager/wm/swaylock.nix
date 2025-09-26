{ config, pkgs, ... }:
{
  programs.swaylock = {
    enable = config.wayland.windowManager.hyprland.enable;
    package = pkgs.swaylock-effects;
    settings = {
      show-failed-attempts = true;
      daemonize = true;
      clock = true;
      timestr = "%k:%M";
      datestr = "%Y-%m-%d";
      image = config.stylix.image;
      indicator = true;
      indicator-radius = 200;
      indicator-thickness = 20;
      effect-blur = "20x10";
      fade-in = 0.2;
      font = "Ubuntu Nerd Font";
    };
  };
}
