{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 5;
        no_fadein = true;
        no_fade_out = true;
      };
      background = {
        monitor = "";
        blur_passes = 1;
        blur_size = 1;
        brightness = 0.5;
      };
      input-field = {
        monitor = "";
        size = "300, 50";
        outline_thickness = 0;
        dots_size = 0.3;
        dots_center = false;
        fade_on_empty = false;
        placeholder_text = "Password";
        position = "0, -200";
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
          position = "0, -150";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
