{ config, ... }:
{
  programs.hyprlock = {
    enable = config.wayland.windowManager.hyprland.enable;
    settings = {
      general = {
        disable_loading_bar = true;
      };

      background = {
        blur_passes = 2;
        contrast = 0.9;
        brightness = 0.5;
        vibrancy = 0.17;
        vibrancy_darkness = 0;
      };

      input-field = {
        monitor = "";
        size = "300, 40";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        fade_on_empty = true;
        placeholder_text = "Enter password...";
        hide_input = false;
        position = "0, 150";
        halign = "center";
        valign = "bottom";
      };

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%H")"'';
          color = "rgb(${config.lib.stylix.colors.base0D})";
          font_family = "Ubuntu Nerd Font";
          font_size = 180;
          position = "0, 150";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%M")"'';
          color = "rgb(${config.lib.stylix.colors.base05})";
          font_family = "Ubuntu Nerd Font";
          font_size = 180;
          position = "0, -75";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = "rgb(${config.lib.stylix.colors.base05})";
          font_family = "Ubuntu Nerd Font";
          position = "100, -130";
          halign = "left";
          valign = "top";
        }
      ];
    };
  };
}
