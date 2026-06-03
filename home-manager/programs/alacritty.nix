{ lib, ... }:
{
  programs.alacritty = {
    enable = false;
    settings = {
      font = lib.mkForce {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 11;
      };
      window = {
        decorations = "none";
        opacity = lib.mkForce 0.7;
        blur = true;
      };
    };
  };
}
