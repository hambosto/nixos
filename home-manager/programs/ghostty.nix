{ lib, ... }:
{
  programs.ghostty = {
    enable = false;
    enableFishIntegration = true;
    settings = {
      background-opacity = lib.mkForce 0.4;
      background-blur = true;
      font-family = lib.mkForce "JetBrainsMono Nerd Font";
      font-size = lib.mkForce 11;
      window-width = 950;
      window-height = 500;
      cursor-style-blink = true;
      copy-on-select = true;
      confirm-close-surface = false;
      font-synthetic-style = true;
      font-thicken = false;
      bold-is-bright = false;
      adjust-box-thickness = 1;
      cursor-style = "bar";
      adjust-cursor-thickness = 1;
      mouse-hide-while-typing = true;
      window-padding-x = 1;
      window-padding-y = 1;
      window-padding-balance = true;
      gtk-single-instance = true;
    };
  };
}
