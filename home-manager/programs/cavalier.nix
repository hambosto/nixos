{ config, ... }:
{
  programs.cavalier = {
    enable = false;
    settings.general = {
      ShowControls = true;
      ColorProfiles = [
        {
          Name = "Default";
          FgColors = [
            "#${config.lib.stylix.colors.base0C}"
            "#${config.lib.stylix.colors.base0D}"
            "#${config.lib.stylix.colors.base07}"
            "#${config.lib.stylix.colors.base0E}"
            "#${config.lib.stylix.colors.base06}"
            "#${config.lib.stylix.colors.base0A}"
            "#${config.lib.stylix.colors.base0F}"
            "#${config.lib.stylix.colors.base08}"
          ];
          BgColors = [ "#${config.lib.stylix.colors.base00}" ];
          Theme = 1;
        }
      ];
      ActiveProfile = 0;
    };
  };
}
