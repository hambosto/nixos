{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = true;
        grace = 0;
        disable_loading_bar = true;
      };
      background = {
        monitor = "";
        blur_passes = 3;
        blur_size = 3;
        noise = 0.05;
        contrast = 1;
        brightness = 0.8;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };
      input-field = {
        monitor = "";
        size = "300, 50";
        outline_thickness = 0;
        dots_size = 0.3;
        dots_center = false;
        fade_on_empty = false;
        placeholder_text = "Password";
        position = "0, -500";
      };
      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b>$(date "+%F")</b>"'';
          color = "rgb(f0f0f0)";
          font_size = 24;
          font_family = "Ubuntu Nerd Font";
          position = "0, -150";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b>$(date "+%H:%M")</b>"'';
          font_size = 64;
          color = "rgb(f0f0f0)";
          font_family = "Ubuntu Nerd Font";
          position = "0, -50";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = " <b>$USER</b>";
          color = "rgb(f0f0f0)";
          font_family = "Ubuntu Nerd Font";
          position = "0, -450";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
