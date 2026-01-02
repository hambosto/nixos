{ config, ... }:
{
  programs.clock-rs = {
    enable = true;
    settings = with config.lib.stylix.colors.withHashtag; {
      general = {
        color = base0D;
        interval = 250;
        blink = true;
        bold = true;
      };

      position = {
        horizontal = "center";
        vertical = "center";
      };

      date = {
        fmt = "%A, %B %d, %Y";
        use_12h = false;
        utc = false;
        hide_seconds = false;
      };
    };
  };
}
