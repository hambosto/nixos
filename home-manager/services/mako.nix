{ config, ... }:
{
  services.mako = {
    enable = true;
    settings = with config.lib.stylix.colors.withHashtag; {
      font = "Ubuntu Nerd Font 14";
      background-color = base00;
      border-color = base0D;
      border-radius = 5;
      text-color = base05;
      progress-color = "over ${base02}";

      "urgency=low" = {
        background-color = base00;
        border-color = base03;
        text-color = base05;
      };
      "urgency=critical" = {
        background-color = base00;
        border-color = base08;
        text-color = base05;
      };
    };
  };
}
