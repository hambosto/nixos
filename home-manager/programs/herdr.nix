{ config, ... }: {
  programs.herdr = {
    enable = false;
    settings = {
      onboarding = false;
      ui = {
        toast.delivery = "herdr";
        status_indicators = "symbols";
        sound.enabled = true;
        tab_bar_right = [
          { type = "zoom"; }
          { type = "hostname"; }
          {
            type = "datetime";
            format = "%H:%M";
          }
          {
            type = "text";
            text = "development";
          }
        ];
        tab_bar_right_separator = " · ";
        window_title = "{hostname}: {workspace}";
      };
      theme.custom = with config.lib.stylix.colors.withHashtag; {
        accent = base0D;
        panel_bg = base00;
        surface_dim = base01;
        surface0 = base02;
        surface1 = base03;
        overlay0 = base03;
        overlay1 = base04;
        subtext0 = base04;
        text = base05;
        red = base08;
        peach = base09;
        yellow = base0A;
        green = base0B;
        teal = base0C;
        blue = base0D;
        mauve = base0E;
      };
    };
  };
}
