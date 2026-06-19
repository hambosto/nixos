{ config, lib, ... }:
{
  programs.alacritty = {
    enable = false;
    settings = {
      font = lib.mkForce {
        normal = {
          family = config.stylix.fonts.monospace.name;
          style = "Regular";
        };
        size = config.stylix.fonts.sizes.terminal;
      };
      window = {
        decorations = "none";
        opacity = lib.mkForce config.stylix.opacity.terminal;
        blur = true;
      };
    };
  };
}
