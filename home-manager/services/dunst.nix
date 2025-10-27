{ config, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        corner_radius = 5;
        frame_width = 2;
        offset = "9x9";
        progress_bar_corner_radius = 5;
        font = "JetBrainsMono Nerd Font 14";
        separator_color = config.lib.stylix.colors.withHashtag.base02;
      };
      urgency_low = {
        background = config.lib.stylix.colors.withHashtag.base00;
        foreground = config.lib.stylix.colors.withHashtag.base05;
        frame_color = config.lib.stylix.colors.withHashtag.base03;
      };

      urgency_normal = {
        background = config.lib.stylix.colors.withHashtag.base00;
        foreground = config.lib.stylix.colors.withHashtag.base05;
        frame_color = config.lib.stylix.colors.withHashtag.base0D;
      };

      urgency_critical = {
        background = config.lib.stylix.colors.withHashtag.base00;
        foreground = config.lib.stylix.colors.withHashtag.base05;
        frame_color = config.lib.stylix.colors.withHashtag.base08;
      };
    };
  };
}
